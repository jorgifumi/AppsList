//
//  SplashViewController.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 07/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController {
    
    
    override func viewDidAppear(animated: Bool) {
        
        installRootViewController()

    }
    
    private func installRootViewController() {
        let navigationController = UINavigationController()
        let wireframe = AppsListWireframe(navigationController: navigationController)
        
        let viewController: UIViewController
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            viewController = AppsGrillCollectionViewController(wireframe: wireframe)
        } else {
            viewController = AppsListTableViewController(wireframe: wireframe)
        }
        
        navigationController.pushViewController(viewController, animated: true)
        
        self.view.window?.rootViewController? = navigationController
    }

    
}