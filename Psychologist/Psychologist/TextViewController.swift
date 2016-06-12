//
//  TextViewController.swift
//  Psychologist
//
//  Created by wolf on 16/6/12.
//  Copyright © 2016年 wolf. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textview: UITextView! {
        didSet {
            textview.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            textview?.text = text
        }
    }

    override var preferredContentSize: CGSize {
        get {
            if (textview != nil && presentingViewController != nil) {
                return textview.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set {
            super.preferredContentSize = newValue
        }
    }
}
