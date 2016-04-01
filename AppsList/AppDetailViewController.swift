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
