//
//  FeaturedTableViewController.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/14/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import UIKit

class FeaturedTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationbar()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MoviePostersCollectionViewController {
            switch segue.identifier {
            case Resources.MovieCategoryName.newlyAdded:
                destination.category = MovieCategory.newly_added
                break
            case Resources.MovieCategoryName.curatorsChoice:
                destination.category = MovieCategory.curators_choice
                break
            case Resources.MovieCategoryName.bestSoundtracks:
                destination.category = MovieCategory.best_soundtracks
                break
            case Resources.MovieCategoryName.theMasterOfSuspense:
                destination.category = MovieCategory.the_master_of_suspense
                break
            case Resources.MovieCategoryName.vengeanceIsHers:
                destination.category = MovieCategory.vengeance_is_hers
                break
            case Resources.MovieCategoryName.blackMagick:
                destination.category = MovieCategory.black_magick
                break
            case Resources.MovieCategoryName.haunts:
                destination.category = MovieCategory.haunts
                break
            case Resources.MovieCategoryName.bingeThis:
                destination.category = MovieCategory.binge_this
                break
            default:
                break
            }
        }
    }
    
    func setUpNavigationbar() {
        let settingsButton = UIButton()
        settingsButton.setImage(UIImage(named: Resources.Image.settingsIcon), for: .normal)
        settingsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: settingsButton)
        let title = UIImageView()
        title.image = UIImage(named: Resources.Image.title)
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        title.widthAnchor.constraint(equalToConstant: 130).isActive = true
        navigationItem.titleView = title
        let searchButton = UIButton()
        searchButton.setImage(UIImage(named: Resources.Image.searchIcon), for: .normal)
        searchButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
    }
    
    @objc func settingsButtonTapped() {
        print("Settings button tapped")
    }
    
    @objc func searchButtonTapped() {
        print("Search button tapped")
    }

}
