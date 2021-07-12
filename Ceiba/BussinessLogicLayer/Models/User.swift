//
//  User.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

class User: DomainBaseEntity, Codable {
    var id: Int
    var name: String
    var username: String
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        address = try values.decodeIfPresent(Address.self, forKey: .address)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        company = try values.decodeIfPresent(Company.self, forKey: .company)
    }
    
    required init() {
        self.id = 0
        self.name = ""
        self.username = ""
        self.email = ""
        self.address = nil
        self.phone = ""
        self.website = ""
        self.company = nil
        super.init()
    }
}
