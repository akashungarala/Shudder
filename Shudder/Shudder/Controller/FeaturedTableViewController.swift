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
        let destination = segue.destination as! MoviePostersCollectionViewController
        switch segue.identifier {
        case "Hero":
            destination.category = MovieCategory.hero
            break
        case "Newly Added":
            destination.category = MovieCategory.newly_added
            break
        case "Curator's Choice":
            destination.category = MovieCategory.curators_choice
            break
        case "Best Soundtracks":
            destination.category = MovieCategory.best_soundtracks
            break
        case "The Master of Suspense":
            destination.category = MovieCategory.the_master_of_suspense
            break
        case "Vengeance is Hers":
            destination.category = MovieCategory.vengeance_is_hers
            break
        case "Black Magick":
            destination.category = MovieCategory.black_magick
            break
        case "Haunts":
            destination.category = MovieCategory.haunts
            break
        case "Binge This":
            destination.category = MovieCategory.binge_this
            break
        default:
            break
        }
    }
    
    func setUpNavigationbar() {
        let settingsButton = UIButton()
        settingsButton.setImage(UIImage(named: "Settings Icon"), for: .normal)
        settingsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: settingsButton)
        let title = UIImageView()
        title.image = UIImage(named: "Title")
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        title.widthAnchor.constraint(equalToConstant: 130).isActive = true
        navigationItem.titleView = title
        let searchButton = UIButton()
        searchButton.setImage(UIImage(named: "Search Icon"), for: .normal)
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
