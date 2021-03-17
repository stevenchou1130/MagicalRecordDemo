//
//  DBHelper.swift
//  MagicalRecordDemo
//
//  Created by Steven on 2021/3/12.
//

import MagicalRecord

/*
 * Reference:
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
    
    var dbStoreName: String {
        return MagicalRecord.defaultStoreName()
    }
    
    init() {
        self.setupDB()
    }
}

// MARK: - Action

extension DBHelper {
    
    func setupDB() {
        
        print("=== Setup DB ===")
        
        MagicalRecord.setLoggingLevel(.error)
        MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: self.dbStoreName)
    }
    
    /*
     * Reference
     * https://stackoverflow.com/questions/14069563/clean-remove-a-database-in-magicalrecord
     */
    func cleanAndResetupDB() {
        
        print("=== Clean and Resetup DB ===")
        
        let dbStore = self.dbStoreName
        
        guard let url = NSPersistentStore.mr_url(forStoreName: dbStore) else {
            print("ERROR: Can not get path of \(dbStore)")
            return
        }
        let walURL = url.deletingPathExtension().appendingPathExtension("sqlite-wal")
        let shmURL = url.deletingPathExtension().appendingPathExtension("sqlite-shm")
        
        MagicalRecord.cleanUp()

        var deleteSuccess: Bool
        do {
            try FileManager.default.removeItem(at: url)
            try FileManager.default.removeItem(at: walURL)
            try FileManager.default.removeItem(at: shmURL)
            deleteSuccess = true
        } catch let error {
            print("ERROR has occured while deleting: \(error)")
            deleteSuccess = false
        }

        if deleteSuccess {
            self.setupDB()
        }
    }

    func store(user: User) {
        
        print("=== Store User ===")
        
        MagicalRecord.save({ (localContext) in

            let cdUser = CDUser.mr_createEntity(in: localContext)
            cdUser?.name = user.name
            cdUser?.age = Int32(user.age)
            cdUser?.createAt = user.createAt
            cdUser?.id = user.id
            let address = user.address as NSDictionary
            cdUser?.address = address
            
        }) { (success, error) in

            print("Store user data successfully")
        }
    }
    
    func fetch() {
        
        print("=== Fetch ===")
         
        let usersSorted = CDUser.mr_findAllSorted(by: "id", ascending: true)
        if let users = usersSorted as? [CDUser] {
            users.forEach { (user) in
                let id = user.id ?? ""
                let name = user.name ?? ""
                let age = "\(user.age)"
                let address = "\(String(describing: user.address))"
                let createAt = "\(user.createAt)"
                print("User info: \(id), \(name), \(age), \(createAt), \(address)")
            }
        }
    }
}
