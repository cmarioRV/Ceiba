//
//  ConfigurationType.swift
//  Ceiba
//
//  Created by Mario Rúa on 11/07/21.
//

import Foundation

public enum ConfigurationType {
    case basic(identifier: String)
    case inMemory(identifier: String?)

    func identifier() -> String? {
        switch self {
        case .basic(let identifier): return identifier
        case .inMemory(let identifier): return identifier
        }
    }
}
