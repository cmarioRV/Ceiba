//
//  ApiRequest.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation
import Alamofire

enum HTTPBodyEncoding {
    case json
    case queryString
    case httpBody
    case undefined
}

struct ApiRequest {
    var url: String
    var method: HTTPMethod
    var parameters: Parameters?
    var headers: HTTPHeaders?
    var encoding: Any
    
    init(url: String, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, encoding: Any = HTTPBodyEncoding.json) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.encoding = encoding
    }
}
