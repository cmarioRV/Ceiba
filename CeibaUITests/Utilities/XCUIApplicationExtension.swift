//
//  XCUIApplicationExtension.swift
//  CeibaUITests
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import XCTest

extension XCUIApplication {
    var isDisplayingUsersViewController: Bool {
        return otherElements["usersViewController"].exists
    }
    
    var isDisplayingUserTableViewCell: Bool {
        return otherElements["userTableViewCell"].exists
    }
    
    var isDisplayingPostsViewController: Bool {
        return otherElements["postsViewController"].exists
    }
}
