//
//  downloadJSON.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 31/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

func getJSON(){
    
    let firstRun = "Grability"
    
    // Check previous data
    
    let ud = NSUserDefaults.standardUserDefaults()
    let isFirstRun = ud.objectForKey(firstRun)
    
    if isFirstRun == nil {
        // Primera vez que se arranca
        let url = NSURL(string: "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json")
        let fm = NSFileManager.defaultManager()
        
        // Download JSON
        if let data = NSData(contentsOfURL: url!) {
            // Save in Documents
            if let dataUrl = fm.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first?.URLByAppendingPathComponent("topfreeapps.json") {
                data.writeToURL(dataUrl, atomically: true)
                print("Downloading...")
                // Marcamos que ya se ha iniciado alguna vez
                ud.setBool(true, forKey: firstRun)
            }
        }else{
            // No network and no previous data
            
        }
    }else{
        // Ya existen datos
        print("Loading data from disk...")
    }
}