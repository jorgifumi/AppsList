//
//  AppsListTableViewController.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 30/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class AppsListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let viewModel: AppsListViewModelType
    private let wireframe: AppsListWireframeType
    
    // MARK: - Initialization
    
    init(wireframe: AppsListWireframeType, viewModel: AppsListViewModelType = AppsListViewModel()) {
        self.wireframe = wireframe
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: NSBundle(forClass: self.dynamicType))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AppsListCell", bundle: nil)
        
        self.tableView.registerNib(nib, forCellReuseIdentifier: kAppsListCellID)

        self.title = "Top Apps List"

        let categoryButton = UIBarButtonItem(barButtonSystemItem: .Organize, target: self, action: #selector(AppsListTableViewController.viewCategories))
        
        self.navigationItem.leftBarButtonItem = categoryButton
        
        viewModel.didUpdateList = tableView.reloadData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(viewModel.numberOfApps)
        return viewModel.numberOfApps
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(kAppsListCellID, forIndexPath: indexPath) as? AppsListCell else {
            fatalError()
        }
        
        let model: AppsListItem = viewModel[indexPath.row]

        // Configure the cell...
        cell.item = model

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return kAppsListCellHeight
    }


    // MARK: - Navigation

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let summary: AppSummary = viewModel[indexPath.row]
        
        wireframe.presentAppDetailWithSummary(summary, fromViewController: self)
    }
    
    func viewCategories() {
        
        wireframe.presentCategoriesList(viewModel.categories, fromViewController: self)
    }
    
}

protocol AppsListViewControllerDelegate {
    func didChangeCategory(newCategory: Category)
    
}

extension AppsListTableViewController: AppsListViewControllerDelegate {
    
    func didChangeCategory(category: Category)  {
        viewModel.category = category
    }
    
}
