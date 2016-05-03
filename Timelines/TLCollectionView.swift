//
//  TLCollectionView.swift
//  Timelines
//
//  Created by Zack Snyder on 3/1/16.
//  Copyright © 2016 Zack Snyder. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class TLCollectionView : UIViewController {
    
    
    @IBOutlet weak var TLCollectionView: UICollectionView!
    
    @IBOutlet weak var headerView: UIView!
    
    
    //UI properties
    var screenSize : CGSize!
    var backgroundView : UIView!
    
    let reuseIdentifier = "Timeline"
    let edgeInsets = UIEdgeInsets(top: 25.0, left: 25.0, bottom: 30.0, right: 25.0)
    var cellSize = CGSizeZero
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add custom background view
        screenSize = UIScreen.mainScreen().bounds.size
        screenSize = CGSizeMake(screenSize.width + 5.0, screenSize.height)
        let screenFrame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: screenSize)
        
        backgroundView = UIView(frame: screenFrame)
        backgroundView.backgroundColor = GradientColor(.TopToBottom, frame: backgroundView.frame, colors: [FlatGreen(), FlatTeal(), FlatBlue()])
        self.view.addSubview(backgroundView)
        
        headerView.backgroundColor = FlatWhite().colorWithAlphaComponent(0.2)
        TLCollectionView.backgroundColor = UIColor.clearColor()
        headerView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        headerView.layer.shadowColor = FlatBlack().CGColor
        headerView.layer.shadowRadius = 5.0
        headerView.layer.shadowOpacity = 1.0
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        
//        print("viewDidLayoutSubviews: \(headerView.frame)")
//    }
    
    
}


extension TLCollectionView : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = FlatWhite().colorWithAlphaComponent(0.2)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
}

extension TLCollectionView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return edgeInsets
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        cellSize = CGSize(width: screenSize.width - 50, height: 200)
        
        return cellSize
    }
    
}

extension TLCollectionView : UICollectionViewDelegate {
    
}