//
//  TLNavigationBar.swift
//  Timelines
//
//  Created by Zack Snyder on 11/20/15.
//  Copyright © 2015 Zack Snyder. All rights reserved.
//

import Foundation
import ChameleonFramework

class TLNavigationBar: UINavigationBar {
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        translucent = true
        backgroundColor = UIColor.clearColor()
        tintColor = FlatWhite()
//        barTintColor = FlatWhite()
        
        titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 20.0)!]

        
//        titleTextAttributes = [NSFontAttributeName : (UIFont(name: "Noteworthy-Bold", size: 20.0)!), NSForegroundColorAttributeName : ContrastColorOf(FlatGreen(), returnFlat: true)]
        
    }
    
}