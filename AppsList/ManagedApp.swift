//
//  ManagedApp.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 31/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation
import CoreData

final class ManagedApp: NSManagedObject {
    
    @NSManaged var identifier: Int64
    @NSManaged var name: String
    @NSManaged var summary: String
    @NSManaged var publisher: String
    @NSManaged var category: ManagedCategory

    @NSManaged private(set) var insertionDate: NSDate
    
    var imageURL: NSURL? {
        get {
            return (imageURLString != nil) ? NSURL(string: imageURLString!) : nil
        }
        
        set {
            imageURLString = newValue?.absoluteString
        }
    }
    
    @NSManaged private var imageURLString: String?
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        insertionDate = NSDate()
    }
}

extension ManagedApp {
    static func fetchRequestForApp(identifier: Int) -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "identifier == %d", identifier)
        fetchRequest.fetchLimit = 1
        
        return fetchRequest
    }
}

extension ManagedApp: ManagedObjectType {
    static var entityName: String {
        return "App"
    }
    
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: "insertionDate", ascending: true)]
    }
}

//extension ManagedApp: ManagedJSONDecodable {
//    func updateWithJSONDictionary(dictionary: JSON) {
//        guard let identifier = dictionary["id"] as? Int,
//            title = dictionary["name"] as? String else {
//                // TODO: throw
//                return
//        }
//        
//        self.identifier = identifier
//        self.title = title
//        self.publisher = (dictionary as NSDictionary).valueForKeyPath("publisher.name") as? String
//        self.imageURLString = (dictionary as NSDictionary).valueForKeyPath("image.small_url") as? String
//    }
//}