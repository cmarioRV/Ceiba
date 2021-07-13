//
//  CellViewModel.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation

protocol CellViewModel {}

protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}
