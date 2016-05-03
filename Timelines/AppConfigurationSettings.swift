//
//  AppConfigurationSettings.swift
//  Timelines
//
//  Created by Zack Snyder on 3/23/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import ChameleonFramework

struct AppConfigurationSettings {
    
//    let primaryColor = FlatWhite()
    
//    let secondaryColor = FlatBlack()
    
//    let backgroundColor = FlatWhite() //UIColor.lightGrayColor()
    
    struct Navigation {
        
//        static let navigationBarTintColor = FlatWhite()
        
        let tintColor = FlatWhite()
    }
    
    struct Cell {
        
        let titleTextColor = FlatBlackDark()
        
        let subtitleTextColor = FlatWhite()
        
        let background = FlatBlack()
    }
    
    struct TableView {
        
        let background = FlatWhite()
    }
    
    func setGradientColor(frame: CGRect) -> UIColor {
        return GradientColor(.LeftToRight, frame: frame, colors: [FlatTeal(), FlatGreenDark()])
    }
}