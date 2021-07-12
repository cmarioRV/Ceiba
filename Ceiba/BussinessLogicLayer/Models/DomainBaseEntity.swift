//
//  DomainBaseEntity.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import CoreData

class DomainBaseEntity: Mappable {
    var objectID: NSManagedObjectID?

    required init() {
    }
}
