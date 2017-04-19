//
//  TMDatabase.swift
//  TMDatabase
//
//  Created by Jason Tsai on 2017/4/20.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import Foundation
import RealmSwift

class TMDatabase {
    static let shared = TMDatabase()
    let realm = try! Realm()
    
    func check<T>(object: T, key: String, value: String, completed: @escaping (T?, Bool)->()) {
        let predicate = NSPredicate(format: "\(key) = %@", value)
        let results = realm.objects(object as! Object.Type).filter(predicate)
        if results.count != 0 {
            completed(results[0] as? T, true)
        }else {
            completed(nil, false)
        }
    }
}
