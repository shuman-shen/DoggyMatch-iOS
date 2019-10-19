//
//  Breed+CoreDataProperties.swift
//  DM1
//
//  Created by karen lee on 19/10/19.
//  Copyright © 2019 karen lee. All rights reserved.
//
//

import Foundation
import CoreData


extension Breed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Breed> {
        return NSFetchRequest<Breed>(entityName: "Breed")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: NSData?
    @NSManaged public var detail: String?
    @NSManaged public var user: User?

}
