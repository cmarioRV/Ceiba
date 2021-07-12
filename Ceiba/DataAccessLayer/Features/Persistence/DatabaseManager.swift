//
//  DatabaseManager.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class DatabaseManager {

    // MARK: - Private properties
    private var storageContext: StorageContext?

    // MARK: - Public properties
    static var shared = DatabaseManager()

    lazy var userDao = UserDao(storageContext: storageContextImpl(), mapper: UserMapper())
    lazy var postDao = PostDao(storageContext: storageContextImpl())

    private init() {
    }

    static func setup(storageContext: StorageContext) {
        shared.storageContext = storageContext
    }

    private func storageContextImpl() -> StorageContext {
        if self.storageContext != nil {
            return self.storageContext!
        }
        fatalError("You must call setup to configure the StoreContext before accessing any dao")
    }

}
