//
//  ViewController.swift
//  Caculator
//
//  Created by wolf on 16/2/25.
//  Copyright © 2016年 wolf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInMiddleOfTypingANumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (!userIsInMiddleOfTypingANumber) {
            display.text = digit
            userIsInMiddleOfTypingANumber = (display.text != "0")
        } else {
            userIsInMiddleOfTypingANumber = true;
            display.text = display.text! + digit
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×":
            performOperation({$0 * $1})
            break
        case "÷":
            performOperation({$1 / $0})
            break
        case "−":
            performOperation({$1 - $0})
            break
        case "+":
            performOperation({$0 + $1})
            break
        case "√":
            performUnaryOperation({sqrt($0)})
            break
        default:
            break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.popLast()!, operandStack.popLast()!)
            enter()
        }
    }
    
    func performUnaryOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.popLast()!)
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack=\(operandStack)\n")
    }
    
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            print("\(newValue)")
        }
    }

}

