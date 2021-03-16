//
//  CDUser+CoreDataProperties.swift
//  
//
//  Created by Steven on 2021/3/16.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var address: NSObject?
    @NSManaged public var age: Int32
    @NSManaged public var createAt: Double
    @NSManaged public var id: String?
    @NSManaged public var name: String?

}
