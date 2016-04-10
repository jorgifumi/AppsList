//
//  CategoriesListViewController.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 06/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class CategoriesListViewController: UITableViewController {
    
    // MARK: - Properties
    private let list: [Category]

    private let viewModel: CategoriesListViewModelType
    //private let wireframe: CategoriesListWireframeType
    
    var delegate: AppsListViewControllerDelegate?
    
    // MARK: - Initialization
    
    init(list: [Category], viewModel: CategoriesListViewModelType = CategoriesListViewModel()) {
        //self.wireframe = wireframe
        self.viewModel = viewModel
        self.list = list
        
        super.init(nibName: nil, bundle: NSBundle(forClass: self.dynamicType))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        
        self.tableView.registerNib(nib, forCellReuseIdentifier: "categoryCell")

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
     
        return list.count + 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)

        // Configure the cell...
        if indexPath.row < list.count {
            cell.textLabel?.text = list[indexPath.row].name
        } else {
            cell.textLabel?.text = "All"
        }
        

        return cell
    }
    

    // MARK: - Navigation

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row < list.count {
            delegate?.didChangeCategory(list[indexPath.row])
        } else {
            delegate?.didChangeCategory(nil)
        }
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
