//
//  User.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
}
