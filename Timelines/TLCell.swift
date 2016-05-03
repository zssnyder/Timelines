//
//  TLCell.swift
//  Timelines
//
//  Created by Zack Snyder on 12/8/15.
//  Copyright © 2015 Zack Snyder. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework
import MGSwipeTableCell

class TLCell : MGSwipeTableCell, MGSwipeTableCellDelegate {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tlImageView: UIImageView!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    
    var deleteButton : MGSwipeButton!
    
    let colorOptions = AppConfigurationSettings.Cell()
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                tlImageView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                tlImageView.addConstraint(aspectConstraint!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        containerView.removeFromSuperview()

//        setupSwipeGestures()
        
        
        tlImageView.clipsToBounds = true
        
        lblStartDate.textColor = colorOptions.subtitleTextColor
        lblEndDate.textColor = colorOptions.subtitleTextColor
        lblTitle.textColor = colorOptions.titleTextColor
        
        /*======================
        MARK: Temp values for UI
        ======================*/
        
        lblStartDate.text = "01/01/2016"
        
        let date = NSDate(timeIntervalSinceNow: 0.0)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let sDate : String = dateFormatter.stringFromDate(date)
        lblEndDate.text = "\(sDate)"
    }
    
    func setTLImage(image : UIImage) {
        
        let aspect = image.size.width / image.size.height
        
        aspectConstraint = NSLayoutConstraint(item: tlImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: tlImageView, attribute: NSLayoutAttribute.Height, multiplier: aspect, constant: 0.0)
        
        tlImageView.image = image
    }

}