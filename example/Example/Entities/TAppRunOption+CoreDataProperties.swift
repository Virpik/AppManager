//
//  TAppRunOption+CoreDataProperties.swift
//  Example
//
//  Created by Virpik on 31/05/2017.
//  Copyright © 2017 Virpik. All rights reserved.
//

import Foundation
import CoreData

extension TAppRunOption {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TAppRunOption> {
        return NSFetchRequest<TAppRunOption>(entityName: "TAppRunOption")
    }

    @NSManaged public var date: Date!
    @NSManaged public var version: String!
}
