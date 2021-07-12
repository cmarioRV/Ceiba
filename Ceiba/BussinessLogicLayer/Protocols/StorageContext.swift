//
//  StorageContext.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import CoreData

protocol StorageContext {

    func create<DBEntity: Storable>(_ model: DBEntity.Type) -> DBEntity?

    func save(object: Storable) throws

    func saveAll(objects: [Storable]) throws

    func update(object: Storable) throws

    func delete(object: Storable) throws

    func deleteAll(_ model: Storable.Type) throws

    func fetch(_ model: Storable.Type, predicate: NSPredicate?, sorted: Sorted?) -> [Storable]
    
    func objectWithObjectId<DBEntity: Storable>(objectId: NSManagedObjectID) -> DBEntity?
}
