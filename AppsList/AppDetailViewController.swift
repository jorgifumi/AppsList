//
//  AppDetailViewController.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 01/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appPublisher: UILabel!
    @IBOutlet weak var appSummary: UILabel!
    @IBOutlet weak var appCategory: UILabel!
    // MARK: - Properties
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
