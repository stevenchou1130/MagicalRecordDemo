//
//  User.swift
//  MagicalRecordDemo
//
//  Created by Steven on 2021/3/12.
//

import Foundation

@objc(User)

class User: NSObject {

    let id: String
    let name: String
    let age: Int
    let address: [String: String]
    let createAt: Double

    init(id: String, name: String, age: Int, address: [String: String]) {
        self.id = id
        self.name = name
        self.age = age
        self.address = address
        self.createAt = Date().timeIntervalSince1970
    }
}
