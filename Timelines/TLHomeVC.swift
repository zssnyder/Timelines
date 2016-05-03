//
//  TLHomeVC.swift
//  Timelines
//
//  Created by Zack Snyder on 3/11/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import ChameleonFramework
import SWRevealViewController
import DZNEmptyDataSet
import EasyAnimation
import Async

class TLHomeViewController : UIViewController {
    
    var menuButton : UIBarButtonItem!
    let menuIcon = UIImage(named: "menu_icon")
    var expandedIndexPath : NSIndexPath = NSIndexPath()
    let imageArray = [UIImage(named: "IMG_1003"), UIImage(named: "IMG_1528"), UIImage(named: "IMG_1346"), UIImage(named: "IMG_0727"), UIImage(named: "IMG_0509"), UIImage(named: "IMG_0535")]
    
    @IBOutlet weak var TableView: TLTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add menu button icon
        let scaledMenu = TLImage().scaleImageToSize(menuIcon!, size: CGSize(width: 32.0, height: 32.0), smooth: false)
        menuButton = UIBarButtonItem(image: scaledMenu, style: .Plain, target: self, action: #selector(SWRevealViewController.revealToggle(_:)))
        
        
        //Initializes side menu segue
        let revealController = self.revealViewController()
        if revealController != nil {
            revealController.frontViewShadowRadius = 5.0
            menuButton.target = revealController
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealController.panGestureRecognizer())
            navigationItem.leftBarButtonItem = menuButton
            
        }
        
        
        
        
        
        // MARK: Setup custom TableView delegates and UI
        
        
        
        TableView.emptyDataSetSource = TableView
        TableView.emptyDataSetDelegate = TableView
        TableView.tableFooterView = UIView()
        TableView.contentInset = UIEdgeInsets(top: -20.0, left: 0.0, bottom: 0.0, right: 0.0)
//        TableView.rowHeight = 100.0
        TableView.estimatedRowHeight = 100.0
        TableView.rowHeight = UITableViewAutomaticDimension
        TableView.backgroundColor = AppConfigurationSettings.TableView().background
        
//        let row = 0
//        let section = 0
//        expandedIndexPath = NSIndexPath(forRow: row, inSection: section)
        
    }
    
    
    
}

extension TLHomeViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.reusableId) as! TLCell
        let image = imageArray[indexPath.row]
        
        
        cell.lblTitle.text = " Timeline \(indexPath.row + 1) "
        cell.tlImageView.image = image
        cell.containerView.backgroundColor = AverageColorFromImage(image!).colorWithAlphaComponent(AppConfigurationSettings.Cell().colorOverlayAlpha).colorWithMinimumSaturation(0.3).lightenByPercentage(0.2)
        
        
        return cell
    }
    
    
    
}

extension TLHomeViewController : UITableViewDelegate {
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! TLCell
        cell.lblTitle.textColor = FlatWhite()
        tableView.beginUpdates()
        
        if indexPath.compare(expandedIndexPath) == .OrderedSame {
            expandedIndexPath = NSIndexPath()
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            cell.lblTitle.textColor = FlatBlackDark()
        } else {
            expandedIndexPath = indexPath
        }
        
        
        
        
        tableView.endUpdates()
//        UIView.animateWithDuration(1.0, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
//            cell?.frame.size.height = 200.0
//            }, completion: nil)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! TLCell
        cell.lblTitle.textColor = FlatBlackDark()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath == expandedIndexPath {
//            let cell = tableView.cellForRowAtIndexPath(indexPath) as! TLCell
//            cell.containerView.backgroundColor = UIColor.clearColor()
            return 200.0
        }
        
        return 100.0
    }
    
}









