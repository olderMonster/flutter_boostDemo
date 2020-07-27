//
//  NavigationViewController.swift
//  SwiftProject
//
//  Created by monster on 2020/7/27.
//  Copyright © 2020 monster. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /**
    也就是当我们调用setNeedsStatusBarAppearanceUpdate的时候,系统会调用Container(容器控制器)的preferredStatusBarStyle这个方法(window?.rootViewController的preferred的方法,一般我们用UINavigationController或者UITabBarController来做Container),也就是根本不会调用子控制器(我们所看到的UIViewcontroller)的preferredStatusBarStyle方法。
     这个时候childForStatusBarHidden和childForStatusBarStyle两个方法就派上用场了
     */
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

    override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
    
}
