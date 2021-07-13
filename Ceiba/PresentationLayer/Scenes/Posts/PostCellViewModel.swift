//
//  PostCellViewModel.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation

struct PostCellViewModel: CellViewModel {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    var cellPressed: (()->Void)?
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
