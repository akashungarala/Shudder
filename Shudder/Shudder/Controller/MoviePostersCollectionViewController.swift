//
//  MoviePostersCollectionViewController.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/14/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import UIKit

// Setting the reusable identifier for the collection view cell
private let reuseIdentifier = Resources.ReuseIdentifier.moviePoster

class MoviePostersCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var category: MovieCategory!
    var moviePosters = [MoviePoster]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMoviePosters()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviePosters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let moviePosterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MoviePosterCollectionViewCell
        if let url = moviePosters[indexPath.row].url {
            moviePosterCollectionViewCell.configureCell(url)
            moviePosterCollectionViewCell.setNeedsLayout()
            moviePosterCollectionViewCell.layoutIfNeeded()
        }
        return moviePosterCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.height * 9) / 16, height: collectionView.bounds.height)
    }
    
    func fetchMoviePosters() {
        FlickrAPI.sharedInstance.fetchPhotoIds(movieCategory: category) { (moviePosters) in
            if moviePosters.count > 0 {
                for index in 0...(moviePosters.count-1) {
                    FlickrAPI.sharedInstance.fetchPhotoUrl(id: moviePosters[index].id, completion: { (url) in
                        moviePosters[index].url = url
                        if index == moviePosters.count-1 {
                            self.moviePosters = moviePosters
                            self.collectionView?.reloadData()
                        }
                    })
                }
                self.collectionView?.reloadData()
            }
        }
    }

}
