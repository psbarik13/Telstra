//
//  AppDelegate.swift
//  Telstra IOS Proficiency Exercise
//
//  Created by partha.sarathi.barik on 13/01/20.
//  Copyright © 2020 partha.sarathi.barik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Load TelstraTableViewController as the initial ViewController
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialViewController = TelstraTableViewController()
        
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        return true
    }
}

