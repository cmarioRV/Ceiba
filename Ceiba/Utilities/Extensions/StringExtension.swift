//
//  StringExtension.swift
//  Ceiba
//
//  Created by Mario Rúa on 10/07/21.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
