//
//  DirectoryHelpers.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 31/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

extension NSURL {
    static func bundledJSONURL() -> NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("topfreeapps",ofType:"json")!)
    }
    
    static var documentsDirectoryURL: NSURL {
        return try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }
}