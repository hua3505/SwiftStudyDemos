//
//  HappinessViewController.swift
//  Happiness
//
//  Created by wolf on 16/5/15.
//  Copyright © 2016年 wolf. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
        }
    }
    
    // a simple model
    var happiness: Int = 100 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 100), 0)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    private func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilnessForFaceView(sender: FaceView) -> Double? {
        // interpret model for view
        return Double(happiness - 50) / 50
    }
}
