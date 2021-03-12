//
//  User.swift
//  MagicalRecordDemo
//
//  Created by Steven on 2021/3/12.
//

import Foundation

@objc(User)

class User: NSObject {
    
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
