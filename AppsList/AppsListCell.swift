//
//  AppsListCell.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 30/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

let kAppsListCellID = "AppsListCell"
let kAppsListCellHeight: CGFloat = 110.0

class AppsListCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appPublisher: UILabel!
    @IBOutlet weak var appCategory: UILabel!
    
    var item: AppsListItem? {
        didSet {
            appName.text = item?.name
            
            if let imageURL = item?.imageURL {
                
                let asyncIcon = AGTAsyncImage(URL: imageURL, defaultImage: UIImage(named: "emptyApp.png"))
                asyncIcon.delegate = self
                icon.image = asyncIcon.image
                
            }
            
            appPublisher.text = item?.publisherName
            appCategory.text = item?.category
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        icon.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AppsListCell: AGTAsyncImageDelegate {
    
    func asyncImageDidChange(aImage: AGTAsyncImage!) {
        icon.image = aImage.image
    }
}