//
//  downloadJSON.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 31/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

private let feedURL = NSURL(string: "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json")
private let storedJSON = "previousData"

func getJSON() -> [JSONDictionary] {
    
    let ud = NSUserDefaults.standardUserDefaults()
    let dataUrl = NSURL.documentsDirectoryURL.URLByAppendingPathComponent("topfreeapps.json")
    
    // Download the newest JSON
    print("Downloading...")
    if let data = NSData(contentsOfURL: feedURL!) {
        
        
        // Save in Documents
        print("Saving data into disk...")
        data.writeToURL(dataUrl, atomically: true)
        
        
        // Marcamos que ya se ha iniciado alguna vez
        ud.setBool(true, forKey: storedJSON)
        
    }else{
        // Can't get data from network
        let previousData = (ud.objectForKey(storedJSON) as? Bool == true)
        
        if !previousData {
            // Load bundled JSON
            if let bundledData = NSData(contentsOfURL: NSURL.bundledJSONURL()) {
                bundledData.writeToURL(dataUrl, atomically: true)
                print("Loading data from bundle...")
            } else {
                // No network, no stored, no bundled Data... ¿WTF?
                fatalError("Impossible to get JSON!")
            }
        }
    }
    
    // Load stored JSON
    print("Loading data from disk...")
    guard let data = NSData(contentsOfURL: dataUrl),
        jsonData = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary,
        feed = jsonData!["feed"] as? JSONDictionary,
        entry = feed["entry"] as? [JSONDictionary] else {
            
            fatalError("Error processing JSON")
            
    }
    return entry

}