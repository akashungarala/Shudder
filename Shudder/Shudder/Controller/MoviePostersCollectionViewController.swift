//
//  MoviePostersCollectionViewController.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/14/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MoviePosterCollectionViewCell"

class MoviePostersCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var category: MovieCategory!
    var moviePosters = [MoviePoster]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMoviePosters()
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
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if category == MovieCategory.hero {
            let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
            let cellWidthncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthncludingSpacing
            let roundedIndex = round(index)
            offset = CGPoint(x: roundedIndex * cellWidthncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
            targetContentOffset.pointee = offset
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if category == MovieCategory.hero {
            return CGSize(width: (collectionView.bounds.width), height: collectionView.bounds.height)
        }
        return CGSize(width: (collectionView.bounds.height * 9) / 16, height: collectionView.bounds.height)
    }
    
    func fetchMoviePosters() {
        FlickrAPI.sharedInstance.fetchPhotoIds(movieCategory: category) { (moviePosters) in
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
