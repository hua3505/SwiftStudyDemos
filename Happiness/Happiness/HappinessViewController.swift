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
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    // a simple model
    var happiness: Int = 100 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = max(min(happiness, 100), 0)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale:CGFloat = 4
    }

    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChanged = -Int(translation.y / Constants.HappinessGestureScale)
            
            if happinessChanged != 0 {
                happiness = happiness + happinessChanged
                print("translation.y = \(translation.y), happinessChanged = \(happinessChanged), happiness = \(happiness)")
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:
            break
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
