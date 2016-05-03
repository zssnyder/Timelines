//
//  TLTabBarController.swift
//  Timelines
//
//  Created by Zack Snyder on 10/22/15.
//  Copyright © 2015 Zack Snyder. All rights reserved.
//

import Foundation
import ChameleonFramework
import UIKit

class TLTabBarController: UITabBarController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.frame.origin = CGPointMake(0.0, 64.0)
        tabBar.barTintColor = FlatGreenDark()
        tabBar.tintColor = FlatWhite()
        tabBar.translucent = false
        tabBar.clipsToBounds = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.image = tabBarItem.image?.imageWithRenderingMode(.AlwaysOriginal)

    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
//        tabBar.tintColor = FlatWhite()
//        item.titleTextAttributesForState(UIControlState.Selected) = [NSForegroundColorAttributeName : FlatWhite()]
        
    }
    
}