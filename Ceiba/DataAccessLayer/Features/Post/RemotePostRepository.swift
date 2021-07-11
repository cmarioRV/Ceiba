//
//  RemotePostRepository.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class RemotePostRepository: PostRepository {
    let apiManager: ApiManager
    
    init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    func getPosts(_ completion: @escaping ([Post]?, Error?) -> Void) {
        let request = ApiRequest(url: "\(Api.baseURL)\(EndPoint.posts)", method: .get)
        apiManager.call(request: request, handler: completion)
    }
    
    func getPosts(_ userId: Int, _ completion: @escaping ([Post]?, Error?) -> Void) {
        let request = ApiRequest(url: "\(Api.baseURL)\(EndPoint.posts)", method: .get, parameters: ["userId": userId])
        apiManager.call(request: request, handler: completion)
    }
}
