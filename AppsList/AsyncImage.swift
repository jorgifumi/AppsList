//
//  AsyncImage.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 10/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

struct AsyncImage {

    var image: UIImage
    var delegate: AsyncImageDelegate
    
    private var remoteImageURL: NSURL
    
    init(withURL url: NSURL, defaultImage: UIImage, delegate: AsyncImageDelegate) {
        self.remoteImageURL = url
        self.image = defaultImage
        self.delegate = delegate

        let localURL = localURLForRemoteURL(url: url)

        if let data = NSData(contentsOfURL: localURL) {
            if let rimage = UIImage(data: data) {
                self.image = rimage
            }
        } else {
                
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                if let data = NSData(contentsOfURL:url) {
                    dispatch_async(dispatch_get_main_queue(), {
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                        self.setNewImageWithData(data)
                    })
                }
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            })
        }
    }
    
    mutating func setNewImageWithData(data: NSData) {
        let localURL = localURLForRemoteURL(url: remoteImageURL)
        
        data.writeToURL(localURL, atomically: true)
        if let image = UIImage(data: data) {
            self.image = image
        }
        delegate.asyncImageDidChange(self)
    }
    
    
    func localURLForRemoteURL(url remoteURL: NSURL) -> NSURL {
        guard let fileName = remoteURL.lastPathComponent,
            dirName = remoteURL.URLByDeletingLastPathComponent?.lastPathComponent else {
              fatalError()
        }
        return NSURL.documentsDirectoryURL.URLByAppendingPathComponent(dirName + fileName)

    }
    
}

protocol AsyncImageDelegate {
    func asyncImageDidChange(aImage: AsyncImage)
}