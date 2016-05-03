//
//  TLRevealController.swift
//  Timelines
//
//  Created by Zack Snyder on 3/10/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import SWRevealViewController

class TLRevealController : SWRevealViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rearVC = rearViewController as! TLSideMenuViewController
        rearVC.revealWidth = self.rearViewRevealWidth
//        rearViewRevealWidth = 200.0
    }
}