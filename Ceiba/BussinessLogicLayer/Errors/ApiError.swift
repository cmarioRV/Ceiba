//
//  ApiError.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

enum ApiError: Error {
    case urlError
    case jsonDecodingError
    case forbidden
    case unauthorized
    case timeout
    case internalServer
    case unknown
}
