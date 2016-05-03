//
//  TLTableView.swift
//  Timelines
//
//  Created by Zack Snyder on 3/14/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import DZNEmptyDataSet
import ChameleonFramework

class TLTableView : UITableView {
    
    let reusableId = "Cell2"
    
    
    
}


extension TLTableView : DZNEmptyDataSetSource {
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        
        let title = "You don't have any Timelines yet."
        let font = UIFont(name: "MarkerFelt-Wide", size: 30.0)
        let attributes : [String : AnyObject] = [NSFontAttributeName: font!, NSForegroundColorAttributeName: FlatGrayDark()]
        
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        
        let description = "Looks like it's time to create a new story!"
        let paragraph = NSMutableParagraphStyle()
        
        paragraph.alignment = .Center
        paragraph.lineBreakMode = .ByWordWrapping
        paragraph.lineSpacing = 1.5
        
        let attributes = [NSForegroundColorAttributeName: FlatGrayDark(), NSParagraphStyleAttributeName: paragraph]

        return NSAttributedString(string: description, attributes: attributes)
    }
    
    func buttonImageForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> UIImage! {
        let image = UIImage(named: "plus_icon")
        let size = CGSize(width: 32.0, height: 32.0)
        let scaledButtonImage = TLImage().scaleImageToSize(image!, size: size, smooth: true)
        return scaledButtonImage
    }
    
}

extension TLTableView : DZNEmptyDataSetDelegate {
    
    func emptyDataSetShouldDisplay(scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(scrollView: UIScrollView!) -> Bool {
        return false
    }
    
    func emptyDataSet(scrollView: UIScrollView!, didTapButton button: UIButton!) {
        
        
    }
}
