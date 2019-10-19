//
//  User+CoreDataProperties.swift
//  DM1
//
//  Created by karen lee on 19/10/19.
//  Copyright © 2019 karen lee. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var userImage: NSData?
    @NSManaged public var breeds: NSSet?

}

// MARK: Generated accessors for breeds
extension User {

    @objc(addBreedsObject:)
    @NSManaged public func addToBreeds(_ value: Breed)

    @objc(removeBreedsObject:)
    @NSManaged public func removeFromBreeds(_ value: Breed)

    @objc(addBreeds:)
    @NSManaged public func addToBreeds(_ values: NSSet)

    @objc(removeBreeds:)
    @NSManaged public func removeFromBreeds(_ values: NSSet)

}
