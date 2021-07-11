//
//  RemoteUserRepository.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

class RemoteUserRepository: UserRepository {
    let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getUsers(_ completion: @escaping ([User]?, Error?) -> Void) {
        let request = ApiRequest(url: "\(Api.baseURL)\(EndPoint.users)", method: .get)
        apiManager.call(request: request, handler: completion)
    }
}
