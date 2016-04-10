//
//  JSONDecodable.swift
//  AppsList
//
//  Created by Jorge Miguel Lucena Pino on 09/04/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]
typealias JSONArray = [JSONDictionary]

protocol JSONDecodable {
    init?(dictionary: JSONDictionary)
}

func decode<T: JSONDecodable>(dictionary: JSONDictionary) -> T? {
    return T(dictionary: dictionary)
}

func decode<T: JSONDecodable>(dictionaries: [JSONDictionary]) -> [T] {
    return dictionaries.flatMap { T(dictionary: $0) } ?? []
}

func decode<T: JSONDecodable>(data: NSData) -> T? {
    guard let JSONObject = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
    dictionary = JSONObject as? JSONDictionary,
    object: T = decode(dictionary) else {
        return nil
    }
    
    return object
}

