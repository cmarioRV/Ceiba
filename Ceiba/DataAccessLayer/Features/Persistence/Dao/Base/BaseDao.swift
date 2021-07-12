//
//  BaseDao.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class BaseDao<DomainEntity: Mappable, DBEntity: Storable> {

    private var storageContext: StorageContext?
    private var mapper: MapperProtocol

    required init(storageContext: StorageContext, mapper: MapperProtocol = Mapper()) {
        self.storageContext = storageContext
        self.mapper = mapper
    }

    func create() -> Mappable? {
        let dbEntity: DBEntity? = storageContext?.create(DBEntity.self)
        return mapToDomain(dbEntity: dbEntity!)
    }

    func save<DomainEntity: Mappable>(object: DomainEntity) throws {
        var dbEntity: DBEntity?
        if object.objectID != nil {
            dbEntity = storageContext?.objectWithObjectId(objectId: object.objectID!)
        } else {
            dbEntity = storageContext?.create(DBEntity.self)
        }

        mapper.mapToDB(from: object, target: dbEntity!)
        try storageContext?.save(object: dbEntity!)
    }

    func saveAll<DomainEntity: Mappable>(objects: [DomainEntity]) throws {
        for domainEntity in objects {
            try self.save(object: domainEntity)
        }
    }

    func update<DomainEntity: Mappable>(object: DomainEntity) throws {
        if object.objectID != nil {
            let dbEntity: DBEntity? = storageContext?.objectWithObjectId(objectId: object.objectID!)
            mapper.mapToDB(from: object, target: dbEntity!)
            try storageContext?.update(object: dbEntity!)
        }
    }

    func delete<DomainEntity: Mappable>(object: DomainEntity) throws {
        if object.objectID != nil {
            let dbEntity: DBEntity? = storageContext?.objectWithObjectId(objectId: object.objectID!)
            try storageContext?.delete(object: dbEntity!)
        }
    }

    func deleteAll() throws {
        try storageContext?.deleteAll(DBEntity.self)
    }

    func fetch(predicate: NSPredicate?, sorted: Sorted? = nil) -> [DomainEntity] {
        let dbEntities = storageContext?.fetch(DBEntity.self, predicate: predicate, sorted: sorted) as? [DBEntity]
        return mapToDomain(dbEntities: dbEntities)
    }

    private func mapToDomain<DBEntity: Storable>(dbEntity: DBEntity) -> DomainEntity {
        var domainEntity = DomainEntity.init()
        mapper.mapToDomain(from: dbEntity, target: &domainEntity)
        return domainEntity
    }

    private func mapToDomain<DBEntity: Storable>(dbEntities: [DBEntity]?) -> [DomainEntity] {
        var domainEntities = [DomainEntity]()
        for dbEntity in dbEntities! {
            domainEntities.append(mapToDomain(dbEntity: dbEntity))
        }
        return domainEntities
    }
}
