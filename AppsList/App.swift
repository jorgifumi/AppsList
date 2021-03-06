//
//  App.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 30/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

public struct App {
    public let name: String
    public let imageURL: NSURL?
    public let summary: String
    public let publisher: String
    public let category: Category
}

extension App: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let imName = dictionary["im:name"] as? JSONDictionary,
        name = imName["label"] as? String,
        summary = (dictionary as NSDictionary).valueForKeyPath("summary.label") as? String,
        publisher = (dictionary as NSDictionary).valueForKeyPath("im:artist.label") as? String,
        category = (dictionary as NSDictionary).valueForKeyPath("category.attributes.label") as? String,
        imageArray = dictionary["im:image"]?.lastObject as? JSONDictionary,
        imageURL = imageArray["label"] as? String else {
                fatalError("Error parsing App")
        }
        self.name = name
        self.summary = summary
        self.publisher = publisher
        self.category = Category(name: category)
        self.imageURL = NSURL(string: imageURL)
    }
}