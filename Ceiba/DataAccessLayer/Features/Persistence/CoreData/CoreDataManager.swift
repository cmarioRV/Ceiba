//
//  CoreDataManager.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation
import CoreData

class CoreDataManager {
    private let container : NSPersistentContainer!

    static var shared = CoreDataManager()
    
    private init() {
        container = NSPersistentContainer(name: "Ceiba")
        setupDatabase()
    }
    
    private func setupDatabase() {
        
        /*Adds necessary support for migration*/
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]
        /*Adds necessary support for migration*/
        
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) — \(error)")
                return
            }
            print("Database ready!")
        }
    }
    
    func viewContext() -> NSManagedObjectContext {
        return container.viewContext
    }
}
