//
//  Mapper.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import CoreData
import Runtime

class Mapper : MapperProtocol {

    func mapToDomain<DBEntity: Storable, DomainEntity: Mappable>(from dbEntity: DBEntity, target domainEntity: inout DomainEntity) {

        let domainEntityInfo = try? typeInfo(of: DomainEntity.self)
        let managedObject: NSManagedObject? = dbEntity as? NSManagedObject
        let keys = managedObject?.entity.attributesByName.keys

        for dbEntityKey in keys! {
            let value = managedObject?.value(forKey: dbEntityKey)
            do {
                let domainProperty = try domainEntityInfo?.property(named: dbEntityKey)
                try domainProperty?.set(value: value as Any, on: &domainEntity)
            } catch {
                print(error.localizedDescription)
            }
        }
        domainEntity.objectID = managedObject?.objectID
    }

    func mapToDB<DomainEntity: Mappable, DBEntity: Storable>(from domainEntity: DomainEntity, target dbEntity: DBEntity) {

        let managedObject: NSManagedObject? = dbEntity as? NSManagedObject
        let keys = managedObject?.entity.attributesByName.keys

        let domainEntityMirror = Mirror(reflecting: domainEntity)
        for dbEntityKey in keys! {
            for property in domainEntityMirror.children.enumerated() where
                property.element.label == dbEntityKey {
                    let value = property.element.value as AnyObject
                    if !value.isKind(of: NSNull.self) {
                        managedObject?.setValue(value, forKey: dbEntityKey)
                    }
            }
        }
    }
}
