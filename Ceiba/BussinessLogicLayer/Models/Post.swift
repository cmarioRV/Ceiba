//
//  Post.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

class Post: DomainBaseEntity, Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "userId"
        case title = "title"
        case body = "body"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        userId = try values.decode(Int.self, forKey: .userId)
        title = try values.decode(String.self, forKey: .title)
        body = try values.decode(String.self, forKey: .body)
    }
    
    required init() {
        self.id = 0
        self.userId = 0
        self.title = ""
        self.body = ""
        super.init()
    }
}
