//
//  AppDelegate.swift
//  Timelines
//
//  Created by Zack Snyder on 10/6/15.
//  Copyright © 2015 Zack Snyder. All rights reserved.
//

import UIKit
import ChameleonFramework
import Parse
import Async

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : FlatWhite()], forState: .Selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : FlatWhite()], forState: .Normal)
        UITabBarItem.appearance().image?.imageWithRenderingMode(.AlwaysOriginal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: FlatWhite() /*, NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 20.0)!*/], forState: .Normal)
        
        
        /*=============================
        Configuration for Parse Backend
        =============================*/
        
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "timelines"
            $0.clientKey = ""
            $0.server = "https://timelines-parse-server.herokuapp.com/parse"
        }
        Parse.initializeWithConfiguration(configuration)
        
        Async.background(block: {
        do {
            try PFUser.logInWithUsername("test", password: "test")
            print("\(PFUser.currentUser()!.username!) logged in successfully")
        } catch {
            print("No logged in user :(")
            }
        })
        
        return true
        
        
//        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TLTableView")
//        let leftViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TLCollectionView")
//        
//        let revealController = PKRevealController(frontViewController: homeViewController, leftViewController: leftViewController)
//        revealController.recognizesResetTapOnFrontView = true
//        revealController.definesPresentationContext = true 
        
//        self.window?.rootViewController = revealController
        
//        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

