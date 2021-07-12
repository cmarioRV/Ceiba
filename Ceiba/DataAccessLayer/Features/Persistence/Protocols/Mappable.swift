//
//  Mappable.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import CoreData

protocol Mappable {
    var objectID: NSManagedObjectID? { get set }
    init()
}
