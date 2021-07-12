//
//  Geo.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class Geo: DomainBaseEntity, Codable {
    var lat: String
    var lng: String
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decode(String.self, forKey: .lat)
        lng = try values.decode(String.self, forKey: .lng)
    }
    
    required init() {
        self.lat = ""
        self.lng = ""
        super.init()
    }
}
