//
//  Post.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
