//
//  ManagedObjectType.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 31/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation
import CoreData

protocol ManagedObjectType {
    static var entityName: String { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }
    static var defaultFetchRequest: NSFetchRequest { get }
}

extension ManagedObjectType {
    static var defaultFetchRequest: NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.sortDescriptors = defaultSortDescriptors
        
        return fetchRequest
    }
}

protocol ManagedJSONDecodable {
    func updateWithJSONDictionary(dictionary: JSONDictionary)
}

func decode<T: NSManagedObject where T: ManagedObjectType, T: ManagedJSONDecodable>(dictionaries: [JSONDictionary], insertingIntoContext context: NSManagedObjectContext) -> [T] {
    
    var objects: [T] = []
    
    context.performBlockAndWait {
        objects = dictionaries.map { dictionary in
            let object = NSEntityDescription.insertNewObjectForEntityForName(T.entityName, inManagedObjectContext: context) as! T
            
            object.updateWithJSONDictionary(dictionary)
            
            return object
        }
    }
    
    return objects
}