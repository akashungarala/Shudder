//
//  Resources.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/15/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import Foundation

// Resources
struct Resources {
    
    // Colors
    struct Color {
        
        static let darkTheme = UIColor(red: 21/255, green: 31/255, blue: 33/255, alpha: 1)
        static let lightTheme = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        
    }
    
    // Movie Category Names
    struct MovieCategoryName {
        
        static let hero = "HERO"
        static let newlyAdded = "Newly Added"
        static let curatorsChoice = "Curator's Choice"
        static let bestSoundtracks = "Best Soundtracks"
        static let theMasterOfSuspense = "The Master of Suspense"
        static let vengeanceIsHers = "Vengeance is Hers"
        static let blackMagick = "Black Magick"
        static let haunts = "Haunts"
        static let bingeThis = "Binge This"
        
    }
    
    // Image Names
    struct Image {
        
        static let logo = "Logo"
        static let title = "Title"
        static let settingsIcon = "Settings Icon"
        static let searchIcon = "Search Icon"
        static let featuredIcon = "Featured Icon"
        
    }
    
    // Reuse Identifiers
    struct ReuseIdentifier {
        
        static let moviePoster = "MoviePosterCollectionViewCell"
        
    }
    
}
