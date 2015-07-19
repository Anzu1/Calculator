//
//  ViewController.swift
//  Calculator
//
//  Created by appcamp on 7/19/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var isUserInTheMiddleOfTypingNumber: Bool = false
    var displayValue: Double {
        get {
            return (display.text! as NSString).doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
    let brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func pushDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isUserInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            isUserInTheMiddleOfTypingNumber = true
        }
    }
    
    
    @IBAction func pushOperation(sender: UIButton) {
        isUserInTheMiddleOfTypingNumber = false
        brain.operation = sender.currentTitle!
        brain.operand1 = displayValue
    }
    
    @IBAction func pushEquals() {
        brain.operand2 = displayValue
        displayValue = brain.calculate()
        isUserInTheMiddleOfTypingNumber = false
    
    }
    
    @IBAction func clearDisplay(sender: UIButton) {
        display.text = "0"
        displayValue = 0
        brain.operand1 = 0
    }
    
    @IBAction func pushDot(sender: UIButton) {
        if isUserInTheMiddleOfTypingNumber {
            if display.text!.rangeOfString(".") == nil {
                display.text = display.text! + "."
            }
        }
    }
}

