//
//  Api.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

struct Api {
    static var baseURL: String {
        return ProcessInfo.processInfo.environment["DEV"] != nil ?
        "https://jsonplaceholder.typicode.com/" : "https://jsonplaceholder.typicode.com/"
    }
}

struct EndPoint {
    static var users: String {
        return "users"
    }
    
    static var posts: String {
        return "posts"
    }
}
