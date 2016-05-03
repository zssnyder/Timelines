//
//  TimeLine.swift
//  Timelines
//
//  Created by Zack Snyder on 11/21/15.
//  Copyright © 2015 Zack Snyder. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class TimeLine : NSObject {
    
    var startDate : NSDate
    var endDate : NSDate
    var events : [Events]
    
    init(startDate: NSDate, endDate: NSDate) {
        
        self.startDate = startDate
        self.endDate = endDate
        events = [Events]()
        
    }
}

class Events {
    
    var date : NSDate
    var category : String
    var imageArray : [UIImage]
    var description : String
    
    init(date: NSDate, cat: String, imageArray: [UIImage], description: String) {
        
        self.date = date
        self.category = cat
        self.imageArray = imageArray
        self.description = description
    }
    
    func getCatColor() -> UIColor {
        switch category {
            case "birth":
                return FlatBlue()
            case "wedding":
                return FlatWhite()
            case "graduation":
                return FlatYellow()
            case "anniversary":
                return FlatRed()
            default:
                return FlatGreen()
            
        }
    }
}

class Birth : Events {
    
    override init(date: NSDate, cat: String, imageArray: [UIImage], description: String) {
        super.init(date: date, cat: cat, imageArray: imageArray, description: "birth")

        
    }
}


class Wedding : Events {
    
    override init(date: NSDate, cat: String, imageArray: [UIImage], description: String) {
        super.init(date: date, cat: cat, imageArray: imageArray, description: "wedding")
    }
}


class Graduation : Events {
    
    override init(date: NSDate, cat: String, imageArray: [UIImage], description: String) {
        super.init(date: date, cat: cat, imageArray: imageArray, description: "graduation")
    }
}


class Anniversary : Events {
    
    override init(date: NSDate, cat: String, imageArray: [UIImage], description: String) {
        super.init(date: date, cat: cat, imageArray: imageArray, description: "anniversary")
    }
}

