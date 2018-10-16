//
//  FlickrAPI.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/14/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import Foundation

class FlickrAPI: NSObject {
    
    static let sharedInstance = FlickrAPI()
    
    static let BASE_URL = "https://api.flickr.com/services/rest/"
    static let METHOD_GET_RECENT = "?method=flickr.photos.getRecent"
    static let METHOD_GET_SIZES = "?method=flickr.photos.getSizes"
    static let API_KEY = "&api_key=ff82c72bee3e7cf6a2ce637d735db71e"
    static let PER_PAGE = "&per_page="
    static let PAGE = "&page="
    static let PHOTO_ID = "&photo_id="
    static let FORMAT = "&format=json"
    static let NO_JSON_CALLBACK = "&nojsoncallback=1"
    
    static func fetchGetSizesUrl(photoId: String) -> String {
        return BASE_URL + METHOD_GET_SIZES + API_KEY + PHOTO_ID + photoId + FORMAT + NO_JSON_CALLBACK
    }
    
    static func fetchGetRecentUrl(movieCategory: MovieCategory) -> String {
        var per_page_value = "25"
        var page_value = ""
        switch movieCategory {
        case .hero:
            per_page_value = "5"
            page_value = "1"
            break
        case .newly_added:
            page_value = "2"
            break
        case .curators_choice:
            page_value = "3"
            break
        case .best_soundtracks:
            page_value = "4"
            break
        case .the_master_of_suspense:
            page_value = "5"
            break
        case .vengeance_is_hers:
            page_value = "6"
            break
        case .black_magick:
            page_value = "7"
            break
        case .haunts:
            page_value = "8"
            break
        case .binge_this:
            page_value = "9"
            break
        }
        return BASE_URL + METHOD_GET_RECENT + API_KEY + PER_PAGE + per_page_value + PAGE + page_value + FORMAT + NO_JSON_CALLBACK
    }
    
    func fetchPhotoIds(movieCategory: MovieCategory, completion: @escaping ([MoviePoster]) -> ()) {
        let url = URL(string: FlickrAPI.fetchGetRecentUrl(movieCategory: movieCategory))!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if error == nil && data != nil {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, AnyObject>
                    if let photos = dict!["photos"] as? Dictionary<String,AnyObject> {
                        if let photo = photos["photo"] as? [Dictionary<String,AnyObject>] {
                            var moviePosters = [MoviePoster]()
                            for object in photo {
                                let moviePoster = MoviePoster()
                                if let id = object["id"] as? String {
                                    moviePoster.id = id
                                }
                                moviePosters.append(moviePoster)
                            }
                            DispatchQueue.main.async(execute: {
                                completion(moviePosters)
                            })
                        }
                    } else {
                        completion([])
                    }
                } catch {
                    completion([])
                }
            } else {
                completion([])
            }
        })
        task.resume()
    }
    
    func fetchPhotoUrl(id: String, completion: @escaping (String?) -> ()) {
        let url = URL(string: FlickrAPI.fetchGetSizesUrl(photoId: id))!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if error == nil && data != nil {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, AnyObject>
                    if let sizes = dict!["sizes"] as? Dictionary<String,AnyObject> {
                        if let size = sizes["size"] as? [Dictionary<String,AnyObject>] {
                            var resultUrl = ""
                            for object in size {
                                if let label = object["label"] as? String {
                                    if label == "Small" {
                                        if let source = object["source"] as? String {
                                            resultUrl = source
                                        }
                                    }
                                }
                            }
                            if resultUrl == "" && size.count > 0 {
                                let object = size[0]
                                if let source = object["source"] as? String {
                                    resultUrl = source
                                } else {
                                    completion(nil)
                                }
                            }
                            DispatchQueue.main.async(execute: {
                                completion(resultUrl)
                            })
                        } else {
                            completion(nil)
                        }
                    } else {
                        completion(nil)
                    }
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        })
        task.resume()
    }
    
}
