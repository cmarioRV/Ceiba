//
//  CoordinatorOutput.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}
