//
//  Address.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

struct Address: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    var phone: String?
    var website: String?
    var company: Company?
}
