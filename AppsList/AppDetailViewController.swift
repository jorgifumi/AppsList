//
//  AppDetailViewController.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 01/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appPublisher: UILabel!
    @IBOutlet weak var appSummary: UILabel!
    @IBOutlet weak var appCategory: UILabel!
    
    let viewModel: AppDetailViewModelType
    
    // MARK: - Initialization
    
    init(viewModel: AppDetailViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: NSBundle(forClass: self.dynamicType))
    }
    
    convenience init(summary: AppSummary) {
        self.init(viewModel: AppDetailViewModel(summary: summary))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = viewModel.summary.imageURL {
                let asyncIcon = AsyncImage(withURL: imageURL, defaultImage: UIImage(named: "emptyApp.png")!, delegate: self)
                appIcon.image = asyncIcon.image

        }

        appName.text = viewModel.summary.name
        appPublisher.text = viewModel.summary.publisherName
        appSummary.text = viewModel.summary.summary
        appCategory.text = viewModel.summary.category

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AppDetailViewController: AsyncImageDelegate {
    
    func asyncImageDidChange(aImage: AsyncImage) {
        appIcon.image = aImage.image
    }
}