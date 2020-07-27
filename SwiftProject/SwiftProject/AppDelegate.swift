//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by monster on 2020/7/24.
//  Copyright © 2020 monster. All rights reserved.
//

import UIKit
import flutter_boost

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        FlutterBoostPlugin.sharedInstance().startFlutter(with: FlutterBoostPlatform()) { (engine) in
            let channel = FlutterMethodChannel.init(name: "com.dealear.ttp", binaryMessenger: engine.binaryMessenger)
            channel.setMethodCallHandler { (call, result) in
                print("setMethodCallHandler")
                if call.method == "updateStatusBarStyle" {
                    guard let dict = call.arguments as! [String:Any]? else {
                        return
                    }
                    guard let style = dict["style"] as! Int? else {
                        return
                    }
                    FlutterContainerView.updateStatusBarStyle(styleValue: style)
                }
            }
        }
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

