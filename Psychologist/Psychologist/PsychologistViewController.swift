//
//  ViewController.swift
//  Psychologist
//
//  Created by wolf on 16/6/5.
//  Copyright © 2016年 wolf. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination:UIViewController? = segue.destinationViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad":
                    hvc.happiness = 0
                    break
                case "happy":
                    hvc.happiness = 100
                    break
                case "nothing":
                    hvc.happiness = 25
                    break
                default:
                    hvc.happiness = 50
                    break
                }
            }
        }
    }

}

