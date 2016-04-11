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
    
    internal let viewModel: AppsListViewModelType
    private let wireframe: AppsListWireframeType
    
    // MARK: - Initialization
    
    init(wireframe: AppsListWireframeType, viewModel: AppsListViewModelType = AppsListViewModel()) {
        self.wireframe = wireframe
        self.viewModel = viewModel
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(180, 180)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
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
        
        self.collectionView!.backgroundColor = UIColor(named: .Background)
        
        let categoryButton = UIBarButtonItem(barButtonSystemItem: .Bookmarks , target: self, action: #selector(AppsGrillCollectionViewController.viewCategories))
        
        self.navigationItem.leftBarButtonItem = categoryButton

        viewModel.didUpdateList = self.collectionView!.reloadData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let summary: AppSummary = viewModel[indexPath.row]
        
        wireframe.presentAppDetailWithSummary(summary, fromViewController: self)
    }
    
    func viewCategories() {
        
        wireframe.presentCategoriesList(viewModel.categories, fromViewController: self)
    }

    
 
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

}

extension AppsGrillCollectionViewController: AppsListViewControllerDelegate {}
