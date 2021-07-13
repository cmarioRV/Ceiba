//
//  TableViewCellExtensions.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import UIKit

public extension UITableViewCell
{
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
