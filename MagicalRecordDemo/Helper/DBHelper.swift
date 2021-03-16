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

    var privateContext: NSManagedObjectContext {
        let context = NSManagedObjectContext.mr_newPrivateQueue()
        context.parent = NSManagedObjectContext.mr_default()
        return context
    }
    
    func setup() {
        
        print("DB setup")
        
        MagicalRecord.setLoggingLevel(.error)
        MagicalRecord.setupAutoMigratingCoreDataStack()
    }
    
    func cleanUp() {
        
        print("DB cleanUp")
        
        MagicalRecord.cleanUp()
    }
    
    func store(user: User) {
        
        MagicalRecord.save({ (localContext) in

            let cdUser = CDUser.mr_createEntity(in: localContext)
            cdUser?.name = user.name
            cdUser?.age = Int32(user.age)
            cdUser?.createAt = user.createAt
            cdUser?.id = user.id
            let address = user.address as NSDictionary
            cdUser?.address = address
            
        }) { (success, error) in

            print("Save successfully")
        }
    }
    
    func fetch() {
         
        let usersSorted = CDUser.mr_findAllSorted(by: "id", ascending: true)
        if let users = usersSorted as? [CDUser] {
            users.forEach { (user) in
                print("User info: \(user.id), \(user.name), \(user.age), \(user.createAt), \(user.address)")
            }
        }
    }
}
