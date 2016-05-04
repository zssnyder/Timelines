//
//  TLTableViewController.swift
//  Timelines
//
//  Created by Zack Snyder on 10/6/15.
//  Copyright © 2015 Zack Snyder. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework
import MXParallaxHeader
import MGSwipeTableCell

let kTableHeaderHeight : CGFloat = 196.0

class TLTableViewController: UIViewController, MXScrollViewDelegate  {
    
    
    var tlArray = [Events]()
//    var tlEvent = Events()
    
    
    //Core elements
    @IBOutlet weak var TLTableView : UITableView!
    @IBOutlet weak var TLNavBar: TLNavigationBar!
    @IBOutlet weak var TLAddButton: UIBarButtonItem!
    
    //Custom views
    var statusBarBg : UIView!
    var headerView : MXParallaxHeader!
    var backgroundView : UIView!
    var backgroundImage : UIImageView!
    var backgroundBlur : UIVisualEffectView!
    
    //Retain view's previous state
    var prevRightButton : UIBarButtonItem!
    var prevLeftButton : UIBarButtonItem!
    var prevTableView : UITableView!
    var prevNumberOfCells = 0
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    //Propeties
    var numberOfCells = 5
    var screenSize = CGSizeZero
    let cellColors = [FlatPlum(), FlatBlue(), FlatGreen(), FlatLime(), FlatYellow(), FlatOrange(), FlatRed()]
    
    
    @IBAction func beginEditing(sender: UIBarButtonItem) {
        
        TLTableView.editing = true
        
        let TLDoneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(TLTableViewController.doneTableEditing(_:)))
        let TLCancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(TLTableViewController.cancelTableEditing(_:)))
        
        if let navItem1 = TLNavBar.items?[0] {
            prevRightButton = navItem1.rightBarButtonItem
            prevLeftButton = navItem1.leftBarButtonItem
            navItem1.rightBarButtonItem = TLDoneButton
            navItem1.leftBarButtonItem = TLCancelButton
            
            prevTableView = TLTableView
            prevNumberOfCells = numberOfCells
        }
        
    }
    
    @IBAction func createNewTimeline(sender: UIBarButtonItem) {
                
        numberOfCells += 1
        TLTableView.reloadData()
        
        //TLTableView.editing = true
        
    }
    
    @IBAction func doneTableEditing(sender: UIBarButtonItem) {
        
        TLTableView.editing = false
        if let navItem1 = TLNavBar.items?[0] {
            navItem1.rightBarButtonItem = prevRightButton
            navItem1.leftBarButtonItem = prevLeftButton
            prevRightButton = nil
            prevLeftButton = nil
            
        }
    }
    
    func cancelTableEditing(sender: UIBarButtonItem) {
        
        TLTableView.editing = false
        numberOfCells = prevNumberOfCells
        TLTableView = prevTableView
        TLTableView.reloadData()
        
        if let navItem1 = TLNavBar.items?[0] {
            navItem1.rightBarButtonItem = prevRightButton
            navItem1.leftBarButtonItem = prevLeftButton
            prevRightButton = nil
            prevLeftButton = nil
            
        }
        
        prevTableView = nil
        
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.mainScreen().bounds.size
        screenSize = CGSizeMake(screenSize.width + 5.0, screenSize.height)
        let screenFrame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: screenSize)

        
        let revealController = self.revealViewController()
        
        if revealController != nil {
            self.view.addGestureRecognizer(revealController.panGestureRecognizer())
        }
        
        
//        backgroundView = UIView(frame: screenFrame)
//        backgroundView.backgroundColor = GradientColor(.LeftToRight, frame: backgroundView.frame, colors: [FlatGreen(), FlatBlue()])
//        self.view.addSubview(backgroundView)
//        
//        headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screenSize.width + 5, height: kTableHeaderHeight))
        headerView = MXParallaxHeader()
        headerView.view = TLTableView.tableHeaderView
        TLTableView.tableHeaderView = nil
        TLTableView.parallaxHeader.view = headerView.view
        TLTableView.parallaxHeader.height = kTableHeaderHeight
        TLTableView.parallaxHeader.mode = .Fill
        TLTableView.parallaxHeader.minimumHeight = 64.0

        
        //Setup Table header
        headerImage.clipsToBounds = true
        headerImage.layer.borderColor = FlatWhite().CGColor
        headerImage.layer.borderWidth = 2.0
        headerLabel.backgroundColor = FlatBlack().colorWithAlphaComponent(0.2)
        
        TLTableView.reloadData()
        
        //Setup Background image and blur
        backgroundView = UIView(frame: screenFrame)
        
        backgroundImage = UIImageView(frame: screenFrame) //(contentsOfFile: "IMG_1003.png")
        backgroundImage.image = headerImage.image
        backgroundImage.clipsToBounds = true
        if let image = backgroundImage {
            backgroundView.addSubview(image)
        }
        
        backgroundBlur = UIVisualEffectView(frame: screenFrame)
        let blurEffect = UIBlurEffect(style: .Dark)
        backgroundBlur.effect = blurEffect
        if let blur = backgroundBlur {
            backgroundView.addSubview(blur)
        }
        
        TLTableView.backgroundView = backgroundView
        
        
        
//        statusBarBg = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width + 5, height: 20))
//        statusBarBg.backgroundColor = FlatGreenDark()
//        view.addSubview(statusBarBg)
    }

    
    /*
    ===========================
    MARK: Custom Scroll Actions
    ===========================
    */
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        headerLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40 + (TLTableView.parallaxHeader.progress) * 15)
    }
    
    
    /*
    =======================
    MARK: TableView methods
    =======================
    */
}
extension TLTableViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TLCell", forIndexPath: indexPath) as! TLCell
        cell.backgroundColor = UIColor.clearColor()
        
        cell.delegate = self
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: FlatRed())]
        cell.rightExpansion.fillOnTrigger = true
        cell.rightExpansion.buttonIndex = 0
        cell.rightExpansion.threshold = 2.5
        
//        cell.backgroundColor = cellColors[indexPath.row].colorWithAlphaComponent(0.2)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells //tlArray.count
    }
    
    
}


    //============================
    //MARK: TABLE DELEGATE METHODS
    //============================

extension TLTableViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            numberOfCells -= 1
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
        }
    }
    
    func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    /*
    ==================================
    MARK: Custom Cell Selection Style
    ==================================
    */
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        

        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        cell?.backgroundColor = UIColor.clearColor()
        let view = UIView(frame: cell!.frame)
        
        view.backgroundColor = UIColor.clearColor() //FlatWhiteDark().colorWithAlphaComponent(0.4)
        cell?.selectedBackgroundView = view
        tableView.reloadData()
    }
}


extension TLTableViewController : MGSwipeTableCellDelegate {
    
    func swipeTableCell(cell: MGSwipeTableCell!, swipeButtonsForDirection direction: MGSwipeDirection, swipeSettings: MGSwipeSettings!, expansionSettings: MGSwipeExpansionSettings!) -> [AnyObject]! {
        
        swipeSettings.transition = .ClipCenter
        if direction == .RightToLeft {
            expansionSettings.buttonIndex = 0
            expansionSettings.fillOnTrigger = true
        }
        
        return nil
        
    }
    
    func swipeTableCell(cell: MGSwipeTableCell!, tappedButtonAtIndex index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        
        
        let path = TLTableView.indexPathForCell(cell)
        numberOfCells -= 1
        TLTableView.deleteRowsAtIndexPaths([path!], withRowAnimation: .Left)
        
        return true
    }
}
    
    
    
    
    

