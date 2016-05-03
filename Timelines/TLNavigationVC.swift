//
//  TLNavigationVC.swift
//  Timelines
//
//  Created by Zack Snyder on 3/11/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import ChameleonFramework

class TLNavigationController : UINavigationController {
    
    let titleFont = UIFont(name: "MarkerFelt-Wide", size: 25.0)
    var menuButton : UIBarButtonItem!
    let bgImage = UIImage(named: "title_image_default")
    
    let colorOptions = AppConfigurationSettings.Navigation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navFrame = CGRect(x: 0.0, y: 0.0, width: navigationBar.frame.width, height: 64.0)
        navigationBar.tintColor = colorOptions.tintColor
        navigationBar.barTintColor = AppConfigurationSettings().setGradientColor(navFrame)
        
//        navigationBar.setBackgroundImage(bgImage, forBarMetrics: .Default)
        
        if let font = titleFont {
            navigationBar.titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName : colorOptions.tintColor]
        }
        
        
    }
}