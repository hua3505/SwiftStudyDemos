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
    
    var brain = CaculatorBrain()
    
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
        if userIsInMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            displayValue = brain.performOperation(operation)
        }
    }
    
    @IBAction func enter() {
        userIsInMiddleOfTypingANumber = false
        if displayValue != nil {
            displayValue = brain.pushOperand(displayValue!)
        }
    }
    
    var displayValue : Double? {
        get {
            if let number = NSNumberFormatter().numberFromString(display.text!) {
                return number.doubleValue
            } else {
                return nil
            }
        }
        set {
            if let value = newValue {
                display.text = "\(value)"
                print("\(value)")
            } else {
                display.text = "nil"
            }
        }
    }

}

