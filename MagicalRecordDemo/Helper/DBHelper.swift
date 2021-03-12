//
//  DBHelper.swift
//  MagicalRecordDemo
//
//  Created by Steven on 2021/3/12.
//

import MagicalRecord

/**
 Reference:
 * https://segmentfault.com/a/1190000004252566
 * https://www.raywenderlich.com/1696-getting-started-with-magicalrecord#toc-anchor-001
 * https://www.raywenderlich.com/2514-magicalrecord-tutorial-for-ios
 * https://www.jianshu.com/p/cd1a06c7ce09
 * https://github.com/ios122/MagicalRecord
 */

class DBHelper {
    
    static let shared = DBHelper()
    
    func setup() {
        MagicalRecord.setupAutoMigratingCoreDataStack()
    }
    
    func cleanUp() {
        MagicalRecord.cleanUp()
    }
    
    func store(data: Any, key: String) {
        
    }
}
