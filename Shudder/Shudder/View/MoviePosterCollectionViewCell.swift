//
//  MoviePosterCollectionViewCell.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/14/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import UIKit

class MoviePosterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: CustomImageView!
    
    func configureCell(_ photoUrl: String) {
        posterImageView.loadImageUsingUrlString(urlString: photoUrl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 5, height: 10)
    }
    
}
