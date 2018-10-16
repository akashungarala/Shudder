//
//  AppDelegate.swift
//  Shudder
//
//  Created by Akash Ungarala on 10/13/18.
//  Copyright © 2018 Akash Ungarala. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Change the text color in the status bar from black (default) to white (light content)
        // In Info.plist, added the property "View controller-based status bar appearance" with Value "No"
        UIApplication.shared.statusBarStyle = .lightContent
        // Change the bar tint color of the navigation bar to the custom color (dark theme)
        UINavigationBar.appearance().barTintColor = Resources.Color.darkTheme
        UINavigationBar.appearance().isTranslucent = false
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
