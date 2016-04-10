//
//  Category.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 07/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

public struct Category {
    public let name: String
}

extension Category: Hashable {
    public var hashValue: Int {
        return name.hashValue
    }
}

extension Category: Equatable {
    var proxyForComparison : String{
        
        get{
            return "\(name)"
        }
    }
}

//MARK: - Operators

public func ==(lhs: Category, rhs: Category) -> Bool{
    
//    // 1er caso: son el mismo objeto
//    guard !(lhs === rhs) else{
//        return true
//    }
    
    // 2do caso: tienen clases distintas
    guard lhs.dynamicType == rhs.dynamicType else{
        return false
    }
    
    // Caso genérico
    return (lhs.proxyForComparison == rhs.proxyForComparison)
    
}