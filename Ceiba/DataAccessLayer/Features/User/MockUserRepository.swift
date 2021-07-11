//
//  MockUserRepository.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

class MockUserRepository: UserRepository {
    let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getUsers(_ completion: @escaping ([User]?, Error?) -> Void) {
        completion([User](), nil)
    }
}
