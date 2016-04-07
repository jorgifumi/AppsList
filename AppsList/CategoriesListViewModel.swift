//
//  CategoriesListViewModel.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 07/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

/// Represents a category list view model
protocol CategoriesListViewModelType: class {
    
    
    /// The number of volumes in the list
    var numberOfCategories: Int { get }
    
    /// Returns the volume item at a given position
    subscript(position: Int) -> CategoriesListItem { get }
}

final class CategoriesListViewModel {
    
    // MARK: - Properties
    
    var model = [Category]()
    
    
    
    
}

extension CategoriesListViewModel: CategoriesListViewModelType {
    var numberOfCategories: Int {
        return model.count
    }
    
    subscript(position: Int) -> CategoriesListItem {
        assert(position < numberOfCategories, "Position out of range")
        
        let category: Category = self.model[position]
        
        return CategoriesListItem(name: category.name)
    }
}