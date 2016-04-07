//
//  AppsListViewModel.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 31/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation
import Freddy

/// Represents a apps list view model
protocol AppsListViewModelType: class {
    
    
    /// The number of volumes in the list
    var numberOfApps: Int { get }
    
    /// Returns the volume item at a given position
    subscript(position: Int) -> AppsListItem { get }
    
    /// Returns the volume summary at a given position
    subscript(position: Int) -> AppSummary { get }
}

final class AppsListViewModel {
    
    // MARK: - Properties
    
    var model = [App]()
    
    init() {
        
        
        let fm = NSFileManager.defaultManager()
        if let dataUrl = fm.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first?.URLByAppendingPathComponent("topfreeapps.json"),
            data = NSData(contentsOfURL: dataUrl) {
            
            do {
                let json = try JSON(data: data)
                self.model = try json.array("feed","entry").map(App.init)
                //print(apps.first)
            } catch {
                fatalError("Error parsing JSON")
            }
        }
    }
}

extension AppsListViewModel: AppsListViewModelType {
    var numberOfApps: Int {
        return model.count
    }

    subscript(position: Int) -> AppsListItem {
        assert(position < numberOfApps, "Position out of range")

        let app: App = self.model[position]

        return AppsListItem(name: app.name, imageURL: app.imageURL, publisherName: app.publisher, category: app.category)
    }

    subscript(position: Int) -> AppSummary {
        assert(position < numberOfApps, "Position out of range")

        let app: App = self.model[position]

        return AppSummary(
            name:  app.name,
            imageURL:  app.imageURL,
            publisherName: app.publisher,
            summary: app.summary,
            category: app.category
        )
    }
}

//final class AppsListViewModel: NSObject {
//    
//    // MARK: - Properties
//    
//    var didUpdateList: () -> () = {}
//    
//    private let store = AppsListStore.sharedStore
//    private let fetchedResultsController: NSFetchedResultsController
//    
//    override init() {
//        self.fetchedResultsController = NSFetchedResultsController(
//            fetchRequest: ManagedApp.defaultFetchRequest,
//            managedObjectContext: store.context,
//            sectionNameKeyPath: nil,
//            cacheName: nil)
//        
//        super.init()
//        
//        fetchedResultsController.delegate = self
//        try! fetchedResultsController.performFetch()
//    }
//    
//    private subscript(position: Int) -> ManagedApp {
//        assert(position < numberOfApps, "Position out of range")
//        
//        let indexPath = NSIndexPath(forItem: position, inSection: 0)
//        guard let app = fetchedResultsController.objectAtIndexPath(indexPath) as? ManagedApp else {
//            fatalError("Couldn't get app at position \(position)")
//        }
//        
//        return app
//    }
//}
//
//extension AppsListViewModel: NSFetchedResultsControllerDelegate {
//    func controllerDidChangeContent(controller: NSFetchedResultsController) {
//        didUpdateList()
//    }
//}
//
//extension AppsListViewModel: AppsListViewModelType {
//    var numberOfApps: Int {
//        return fetchedResultsController.sections?.first?.numberOfObjects ?? 0
//    }
//    
//    subscript(position: Int) -> AppsListItem {
//        assert(position < numberOfApps, "Position out of range")
//        
//        let app: ManagedApp = self[position]
//        
//        return AppsListItem(name: app.name, image: app.imageURL, summary: app.summary, category: app.category)
//    }
//    
//    subscript(position: Int) -> AppSummary {
//        assert(position < numberOfApps, "Position out of range")
//        
//        let app: ManagedApp = self[position]
//        
//        return AppSummary(
//            name:  app.name,
//            imageURL:  app.imageURL,
//            publisherName: app.publisher,
//            summary: app.summary,
//            category: app.category
//        )
//    }
//}