//
//  TLSideMenuVC.swift
//  Timelines
//
//  Created by Zack Snyder on 3/11/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import SWRevealViewController
import ChameleonFramework
import MXParallaxHeader

class TLSideMenuViewController : UITableViewController, MXScrollViewDelegate {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var sharedImage: UIImageView!
    @IBOutlet weak var followingImage: UIImageView!
    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var supportImage: UIImageView!
    
    @IBOutlet weak var headerBG: UIView!
    
    let avatarIcon = UIImage(named: "avatar_icon_white")
    let profileIcon = UIImage(named: "profile_icon_white")
    let sharedIcon = UIImage(named: "shared_icon_white")
    let followingIcon = UIImage(named: "following_icon_white")
    let settingsIcon = UIImage(named: "settings_icon_white")
    let supportIcon = UIImage(named: "support_icon_white")
    
    var revealWidth : CGFloat = 0.0
    let kHeaderHeight : CGFloat = 200.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let screenSize = UIScreen.mainScreen().bounds.size
//        let statusBar = CGRect(x: 0.0, y: -20.0, width: screenSize.width, height: 20.0)
//        let statusBarView = UIView(frame: statusBar)
//        statusBarView.backgroundColor = FlatGrayDark()
//        tableView.addSubview(statusBarView)
        
        //Convert avatar image to white
//        var avatar = avatarIcon
//        avatar = TLImage().invertImageColors(avatar!)
//        avatar = TLImage().convertImageToBlackAndWhite(avatar!)
        avatarImage.image = avatarIcon
        
        //Smoothly scale menu image icons
        let finalPro = TLImage().scaleImageToSize(profileIcon!, size: profileImage.frame.size, smooth: true)
        let finalSha = TLImage().scaleImageToSize(sharedIcon!, size: sharedImage.frame.size, smooth: true)
        let finalFol = TLImage().scaleImageToSize(followingIcon!, size: followingImage.frame.size, smooth: true)
        let finalSet = TLImage().scaleImageToSize(settingsIcon!, size: settingsImage.frame.size, smooth: true)
        let finalSup = TLImage().scaleImageToSize(supportIcon!, size: supportImage.frame.size, smooth: true)
        
        profileImage.image = finalPro
        profileImage.clipsToBounds = true
        sharedImage.image = finalSha
        sharedImage.clipsToBounds = true
        followingImage.image = finalFol
        followingImage.clipsToBounds = true
        settingsImage.image = finalSet
        settingsImage.clipsToBounds = true
        supportImage.image = finalSup
        supportImage.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        headerBG.backgroundColor = GradientColor(.LeftToRight, frame: headerBG.frame, colors: [FlatTeal(), FlatGreenDark()])
        
        //Setup parallaxHeader
        let header = MXParallaxHeader()
        header.view = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.parallaxHeader.view = header.view
        tableView.parallaxHeader.height = kHeaderHeight
        tableView.parallaxHeader.mode = .Fill
        tableView.parallaxHeader.minimumHeight = 20.0
        
        let contentInsets = UIEdgeInsets(top: kHeaderHeight, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.contentInset = contentInsets
        let contentOffset = CGPoint(x: 0.0, y: -kHeaderHeight)
        tableView.contentOffset = contentOffset
        
        

    }

    
    /* ===================
    MARK: Delegate Methods
    ====================*/
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rCell = tableView.cellForRowAtIndexPath(indexPath)
        
        if let cell = rCell {
            let backgroundView = UIView(frame: cell.frame)
            backgroundView.backgroundColor = GradientColor(.LeftToRight, frame: cell.frame, colors: [FlatTeal(), FlatGreenDark()])
            cell.selectedBackgroundView = backgroundView
        }
    }
    
    
    
}