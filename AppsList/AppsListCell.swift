//
//  AppsListCell.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 30/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

let kAppsListCellID = "NewsItemCell"
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
                //imageView.kf_setImageWithURL(imageURL)
            }
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
