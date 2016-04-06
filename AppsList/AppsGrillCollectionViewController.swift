//
//  AppsGrillCollectionViewController.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 30/03/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

private let reuseIdentifier = kAppsGrillCellID

class AppsGrillCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let viewModel: AppsListViewModelType
    private let wireframe: AppsListWireframeType
    
    // MARK: - Initialization
    
    init(wireframe: AppsListWireframeType, viewModel: AppsListViewModelType = AppsListViewModel()) {
        self.wireframe = wireframe
        self.viewModel = viewModel
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(200, 200)
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        layout.sectionInset = UIEdgeInsetsMake(30, 30, 30, 30)
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AppsGrillCell", bundle: nil)
        
        self.collectionView!.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.title = "Top Apps List"
        
        let categoryButton = UIBarButtonItem(barButtonSystemItem: .Organize, target: self, action: #selector(AppsListTableViewController.viewCategories))
        
        self.navigationItem.leftBarButtonItem = categoryButton

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(AppsGrillCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfApps
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? AppsGrillCell else {
            fatalError()
        }

    
        let model: AppsListItem = viewModel[indexPath.row]
        
        // Configure the cell...
        cell.item = model
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
