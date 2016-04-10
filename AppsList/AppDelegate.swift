//
//  AppDelegate.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 29/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.rootViewController = SplashViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

