//
//  User+CoreDataProperties.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 07/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var gamesCompleted: Int64
    @NSManaged public var numbersGuessed: Int64

}
