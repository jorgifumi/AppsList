//
//  AppsListStore.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 01/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation
import CoreData

class AppsListStore {
    
    static let sharedStore =  AppsListStore(documentName: "TopApps")
    
    private let managedStore: ManagedStore
    let context: NSManagedObjectContext
    
    private init(documentName: String) {
        self.managedStore = try! ManagedStore(documentName: documentName)
        self.context = managedStore.contextWithConcurrecyType(.MainQueueConcurrencyType)
    }
    
//    func containsVolume(identifier: Int) -> Bool {
//        let fetchRequest = ManagedApp.fetchRequestForVolume(identifier)
//        let count = context.countForFetchRequest(fetchRequest, error: nil)
//        
//        return (count != NSNotFound) && (count > 0)
//    }
    
    func removeVolume(identifier: Int) throws {
        let fetchRequest = ManagedApp.fetchRequestForApp(identifier)
        let apps = try context.executeFetchRequest(fetchRequest) as! [ManagedApp]
        
        if apps.count > 0 {
            context.deleteObject(apps[0])
            try context.save()
        }
    }
    
    func addVolume(summary: AppSummary) throws {
        let app = NSEntityDescription.insertNewObjectForEntityForName(ManagedApp.entityName, inManagedObjectContext: context) as! ManagedApp
        
        app.name = summary.name
        app.summary = summary.summary
        app.category.name = summary.category
        app.imageURL = summary.imageURL
        
        try context.save()
    }
}