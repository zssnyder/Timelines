//
//  TLMainViewController.swift
//  Timelines
//
//  Created by Zack Snyder on 10/8/15.
//  Copyright © 2015 Zack Snyder. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class TLMainViewController: UIViewController {
    
    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var settingsIcon: UIImageView!
    @IBOutlet weak var timelinesIcon: UIImageView!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        let nextVC = self.storyboard?.instantiateViewControllerWithIdentifier("TLNavTable")
//        self.navigationController?.pushViewController(nextVC!, animated: true)
        self.showViewController(nextVC!, sender: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GradientColor(.LeftToRight, frame: self.view.frame, colors: [FlatTeal(), FlatGreenDark()])
    }
}