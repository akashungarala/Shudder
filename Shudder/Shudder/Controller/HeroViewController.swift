//
//  HeroViewController.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/15/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {
    
    @IBOutlet var carouselView: iCarousel!
    
    var moviePosters = [MoviePoster]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fetchMoviePosters()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView.type = .rotary
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView.reloadData()
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return moviePosters.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempViewFrame = CGRect(x: 0, y: 0, width: carouselView.frame.width, height: carouselView.frame.height)
        let imageViewFrame = CGRect(x: 0, y: 0, width: carouselView.frame.width, height: carouselView.frame.height)
        let tempView = UIView(frame: tempViewFrame)
        let imageView = CustomImageView(frame: imageViewFrame)
        if (index < moviePosters.count) && moviePosters[index].url != nil {
            imageView.loadImageUsingUrlString(urlString: moviePosters[index].url)
        } else {
            imageView.backgroundColor = Resources.Color.darkTheme
            imageView.image = UIImage(named: Resources.Image.title)
        }
        tempView.addSubview(imageView)
        tempView.layer.cornerRadius = 5.0
        return tempView
    }
    
    func fetchMoviePosters() {
        FlickrAPI.sharedInstance.fetchPhotoIds(movieCategory: .hero) { (moviePosters) in
            if moviePosters.count > 0 {
                for index in 0...(moviePosters.count-1) {
                    FlickrAPI.sharedInstance.fetchPhotoUrl(id: moviePosters[index].id, completion: { (url) in
                        moviePosters[index].url = url
                        if index == moviePosters.count-1 {
                            self.moviePosters = moviePosters
                            self.carouselView.reloadData()
                        }
                    })
                }
                self.carouselView.reloadData()
            }
        }
    }
    
}
