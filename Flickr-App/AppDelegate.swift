//
//  AppDelegate.swift
//  Flickr-Assignment
//
//  Created by Lokesh on 22/08/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let assesmble = PhotosAssembly()
        let navigationController = UINavigationController(rootViewController: assesmble.assemblyModule())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

