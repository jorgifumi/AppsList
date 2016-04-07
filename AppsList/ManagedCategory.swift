//
//  ManagedCategory.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 06/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation
import CoreData

final class ManagedCategory: NSManagedObject {
    
    @NSManaged var identifier: Int64
    @NSManaged var name: String
    @NSManaged var apps: [ManagedApp]
    
}

extension ManagedCategory {
    static func fetchRequestForCategory(identifier: Int) -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "identifier == %d", identifier)
        fetchRequest.fetchLimit = 1
        
        return fetchRequest
    }
}

extension ManagedCategory: ManagedObjectType {
    static var entityName: String {
        return "Category"
    }
    
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: "name", ascending: true)]
    }
}