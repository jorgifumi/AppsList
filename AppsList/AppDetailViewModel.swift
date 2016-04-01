//
//  AppDetailViewModel.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 01/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

protocol AppDetailViewModelType: class {
    
    /// The app summary
    var summary: AppSummary { get }
}

final class AppDetailViewModel: AppDetailViewModelType {
    
    
    let summary: AppSummary
    
    init(summary: AppSummary) {
        self.summary = summary
    }

}