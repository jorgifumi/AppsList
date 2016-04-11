//
//  AppsGrillCell.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 30/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

let kAppsGrillCellID = "AppsGrillCell"

class AppsGrillCell: UICollectionViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appCategory: UILabel!
    @IBOutlet weak var appPublisher: UILabel!


    var item: AppsListItem? {
        didSet {

            appName.text = item?.name
            
            if let imageURL = item?.imageURL {
                
                let asyncIcon = AsyncImage(withURL: imageURL, defaultImage: UIImage(named: "emptyApp.png")!, delegate: self)
                icon.image = asyncIcon.image
                
            }
            appPublisher.text = item?.publisherName
            appCategory.text = item?.category
        }
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        icon.image = nil
    }

}


extension AppsGrillCell: AsyncImageDelegate {
    
    func asyncImageDidChange(aImage: AsyncImage) {
        icon.image = aImage.image
    }
}