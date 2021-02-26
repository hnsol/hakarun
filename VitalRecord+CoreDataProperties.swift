//
//  VitalRecord+CoreDataProperties.swift
//  hakarun
//
//  Created by masatora on 2021/02/26.
//
//

import Foundation
import CoreData


extension VitalRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VitalRecord> {
        return NSFetchRequest<VitalRecord>(entityName: "VitalRecord")
    }

    @NSManaged public var temperature: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var isDone: Bool

}

extension VitalRecord : Identifiable {

}
