//
//  ApiManager.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

import Alamofire

class ApiManager {
    func call<T>(request: ApiRequest, handler: @escaping (T?, _ error: ApiError?)->()) where T: Codable {
//        AF.request(request.url, method: request.method, parameters: request.parameters).validate().responseJSON { response in
//            debugPrint(response)
//
//            switch response.result {
//            case .success(_):
//                let decoder = JSONDecoder()
//                if let jsonData = response.data {
//                    let result = try! decoder.decode(T.self, from: jsonData)
//                    handler(result, nil)
//                }
//                break
//            case .failure(_):
//                handler(nil, self.parseApiError(data: response.data))
//                break
//            }
//        }
        
        AF.request(request.url, method: request.method, parameters: request.parameters).responseDecodable(of: T.self) { response in
            debugPrint(response)
            
            switch response.result {
            case .success(_):
                let decoder = JSONDecoder()
                if let jsonData = response.data {
                    let result = try! decoder.decode(T.self, from: jsonData)
                    handler(result, nil)
                }
                break
            case .failure(let error):
                handler(nil, self.handleError(error))
                //handler(nil, self.parseApiError(data: response.data))
                break
            }
        }
    }
    
    private func handleError(_ response: AFError) -> ApiError {
        
        switch response.responseCode {
        case 500:
            return ApiError.internalServer
        case 504:
            return ApiError.timeout
        case 401:
            return ApiError.unauthorized
        case 403:
            return ApiError.forbidden
        default:
            return ApiError.unknown
        }
    }
    
//    private func parseApiError(data: Data?) -> ApiError {
//        let decoder = JSONDecoder()
//        if let jsonData = data, let error = try? decoder.decode(ErrorModel.self, from: jsonData) {
//            return (title: "error_title".localized, body: error.key ?? error.message)
//        }
//        return (title: "error_title".localized, body: "error_unknown".localized)
//    }
}
