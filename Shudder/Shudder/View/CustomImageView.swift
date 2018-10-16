//
//  CustomImageView.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/15/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import UIKit

// Creating cache object for the image with the url as its key
let imageCache = NSCache<AnyObject, UIImage>()

// Custom Image View which can load an image from the url
class CustomImageView: UIImageView {
    
    // Url for the image
    var imageUrlString: String?
    
    // Function to load the image using the url
    func loadImageUsingUrlString(urlString: String) {
        // Assigning the given url value to the class variable
        imageUrlString = urlString
        // Creating a url from the string
        let url = URL(string: urlString)
        // Removing the image
        image = nil
        // Retrieving the image from the cache using the url
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject)  {
            // Assigning the image retrieved from the cache
            self.image = imageFromCache
            // Return the image
            return
        }
        // Starting the data download using the image url
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            // Checking for any error
            if error != nil {
                // Printing the error during the download
                print(error!)
                return
            }
            // Loading the image asynchronously
            DispatchQueue.main.async(execute: {
                // Creating an image from the downloaded data
                let imageToCache = UIImage(data: data!)
                // Assigning the loaded image to the cache for the url
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                // Checking for the image url value
                if self.imageUrlString == urlString {
                    // Assigning the image in cache
                    self.image = imageToCache
                }
            })
            // Start the process
            }.resume()
    }
    
}
