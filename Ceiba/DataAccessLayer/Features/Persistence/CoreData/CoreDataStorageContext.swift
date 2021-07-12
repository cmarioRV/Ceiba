//
//  CoreDataStorageContext.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import CoreData

class CoreDataStorageContext: StorageContext {
    
    var managedContext: NSManagedObjectContext?

    required init(configuration: ConfigurationType = .basic(identifier: "Ceiba")) {
        switch configuration {
        case .basic:
            initDB(modelName: configuration.identifier(), storeType: .sqLiteStoreType)
        case .inMemory:
            initDB(storeType: .inMemoryStoreType)
        }
    }

    private func initDB(modelName: String? = nil, storeType: StoreType) {
        let coordinator = CoreDataStoreCoordinator.persistentStoreCoordinator(modelName: modelName, storeType: storeType)
        self.managedContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.managedContext?.persistentStoreCoordinator = coordinator
    }
}

extension CoreDataStorageContext {
    func objectWithObjectId<DBEntity: Storable>(objectId: NSManagedObjectID) -> DBEntity? {
        do {
            let result = try managedContext!.existingObject(with: objectId)
            return result as? DBEntity
        } catch {
            print("Failure")
        }
        
        return nil
    }
    
    func create<DBEntity>(_ model: DBEntity.Type) -> DBEntity? where DBEntity : Storable {
        let entityDescription =  NSEntityDescription.entity(forEntityName: String.init(describing: model.self),
                                                            in: managedContext!)
        let entity = NSManagedObject(entity: entityDescription!,
                                     insertInto: managedContext)
        return entity as? DBEntity
    }
    
    func save(object: Storable) throws {
        do {
            try managedContext!.save()
        } catch {
            throw error
        }
    }
    
    func saveAll(objects: [Storable]) throws {
        
    }
    
    func update(object: Storable) throws {
        
    }
    
    func delete(object: Storable) throws {
        
    }
    
    func deleteAll(_ model: Storable.Type) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String.init(describing: model.self))
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedContext!.execute(batchDeleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
    func fetch(_ model: Storable.Type, predicate: NSPredicate?, sorted: Sorted?) -> [Storable] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: String.init(describing: model.self))
        request.predicate = predicate
        if let sorted = sorted {
            request.sortDescriptors = [NSSortDescriptor.init(key: sorted.key, ascending: sorted.ascending)]
        }
        
        var data: [Storable]
        do {
            data = try managedContext!.fetch(request) as? [Storable] ?? [Storable]()
            return data
        } catch {
            print("Fetch failed")
            return []
        }
    }
}
