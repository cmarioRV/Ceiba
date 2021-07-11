//
//  UserRepository.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

protocol UserRepository {
    func getUsers(_ completion: @escaping([User]?, Error?) -> Void)
}
