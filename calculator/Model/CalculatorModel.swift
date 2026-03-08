//
//  CalculatorModel.swift
//  calculator
//
//  Created by theo tsouroupakis on 2025-10-04.
//

import Foundation
import SwiftUI

enum Keys: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    
    case add = "+"
    case substract = "-"
    case multiply = "x"
    case divide = "/"
    
    
    case clear = "AC"
    case negative = "-/+"
    case decimal = "."
    case percent = "%"
    
    
    case equal = "="
    
    var buttonColor: Color {
        switch self {
        case .add, .substract, .multiply, .divide, .equal:
            return Color.purple
        case .clear, .negative, .percent:
            return Color.white
        default:
            return Color.orange
        
        }
        
    }
}

enum Operation {
    case add, substract, multiply, divide, none
}
