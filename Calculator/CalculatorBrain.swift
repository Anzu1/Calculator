//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by appcamp on 7/19/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var operation: String = "="
    var operand1: Double = 0
    var operand2: Double = 0
    
    func calculate() -> Double {
        switch operation {
            case "+": return operand2 + operand1
            case "-": return operand1 - operand2
            case "*": return operand2 * operand1
            case "/":
                if operand1.isZero==false {
                    return operand1 / operand2
                }
                else {
                    return 0
                }
            default: return 0
        }
    }
}