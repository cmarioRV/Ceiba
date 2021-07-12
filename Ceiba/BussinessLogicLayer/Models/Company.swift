//
//  Company.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class Company: DomainBaseEntity, Codable {
    var name: String
    var catchPhrase: String
    var bs: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        catchPhrase = try values.decode(String.self, forKey: .catchPhrase)
        bs = try values.decode(String.self, forKey: .bs)
    }
    
    required init() {
        self.name = ""
        self.catchPhrase = ""
        self.bs = ""
        super.init()
    }
}
