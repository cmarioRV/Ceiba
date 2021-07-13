//
//  UserCellViewModel.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation

struct UserCellViewModel: CellViewModel {
    let userId: Int
    let title: String
    let phone: String
    let email: String?
    
    var cellPressed: (()->Void)?
    
    init(userId: Int, title: String, phone: String, email: String?) {
        self.userId = userId
        self.title = title
        self.phone = phone
        self.email = email
    }
}
