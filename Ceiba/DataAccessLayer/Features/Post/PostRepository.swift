//
//  PostRepository.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

protocol PostRepository {
    func getPosts(_ completion: @escaping([Post]?, Error?) -> Void)
    func getPosts(_ userId: Int, _ completion: @escaping([Post]?, Error?) -> Void)
}
