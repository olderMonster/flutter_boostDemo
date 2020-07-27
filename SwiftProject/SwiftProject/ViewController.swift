//
//  ViewController.swift
//  SwiftProject
//
//  Created by monster on 2020/7/24.
//  Copyright © 2020 monster. All rights reserved.
//

import UIKit
import flutter_boost

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "iOS VC"
        view.backgroundColor = .white
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 20, y: 100, width: 80, height: 30)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        
    }

    
    @objc func click() {
        //跳转flutter页面
        FlutterBoostPlugin.open("flutter_first", urlParams: ["title":"你是我的小苹果"], exts: [String:Any](), onPageFinished: { results in
            
        }) { finished in
            
        }
    }

}

