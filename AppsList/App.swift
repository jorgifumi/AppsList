//
//  App.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 30/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation
import Freddy

public struct App {
    public let name: String
    public let imageURL: NSURL?
    public let summary: String
    public let publisher: String
    public let category: String
}

extension App: JSONDecodable {
    public init(json value: JSON) throws {
        name = try value.string("im:name","label")
        let imagearray = try value.array("im:image")
        imageURL = NSURL(string:  try imagearray.last!.string("label"))
        summary = try value.string("summary","label")
        publisher = try value.string("im:artist","label")
        category = try value.string("category","attributes","label")
    }
}