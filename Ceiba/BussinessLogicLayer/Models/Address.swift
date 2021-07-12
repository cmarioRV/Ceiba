//
//  Address.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class Address: DomainBaseEntity, Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    
    enum CodingKeys: String, CodingKey {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        suite = try values.decodeIfPresent(String.self, forKey: .suite)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
    }
    
    required init() {
        self.street = ""
        self.suite = ""
        self.city = ""
        self.zipcode = ""
        self.geo = nil
        super.init()
    }
}
