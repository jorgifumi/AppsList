//
//  File.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 01/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation
import UIKit

protocol AppsListWireframeType: class {
    
    func presentAppDetailWithSummary(summary: AppSummary, fromViewController viewController: UIViewController)
    
    func presentCategoriesList(list: [Category], fromViewController viewcontroller: AppsListViewControllerDelegate)
}

final class AppsListWireframe: NSObject {
    
    private unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension AppsListWireframe: AppsListWireframeType {
    
    
    func presentAppDetailWithSummary(summary: AppSummary, fromViewController viewController: UIViewController) {
        
        let detailViewController = AppDetailViewController(summary: summary)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func presentCategoriesList(list: [Category], fromViewController viewcontroller: AppsListViewControllerDelegate) {
        
        let categoriesViewController = CategoriesListViewController(list: list)
        categoriesViewController.delegate = viewcontroller
        
        navigationController.presentViewController(categoriesViewController, animated: true, completion: nil)
    }
}
