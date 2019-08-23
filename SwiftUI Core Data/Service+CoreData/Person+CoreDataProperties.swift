//
//  Person+CoreDataProperties.swift
//  SwiftUI Core Data
//
//  Created by Dmitry Novosyolov on 23/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        let request = NSFetchRequest<Person>(entityName: "Person")
        let sortDescriptor = NSSortDescriptor(key: "isFavorite", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: String?
    @NSManaged public var gender: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var photoData: Data?

}
