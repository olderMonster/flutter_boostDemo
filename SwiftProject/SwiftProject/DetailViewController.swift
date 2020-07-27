//
//  DetailViewController.swift
//  SwiftProject
//
//  Created by monster on 2020/7/24.
//  Copyright © 2020 monster. All rights reserved.
//

import UIKit
import flutter_boost

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "OC的页面"
        view.backgroundColor = .white
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 20, y: 100, width: 80, height: 30)
        button.backgroundColor = .red
        button.setTitle("点击push大屏Flutter", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
    }
    
    @objc func click() {
        FlutterBoostPlugin.open("flutter_second", urlParams: [String:Any](), exts: [String:Any](), onPageFinished: {
            result in
        }, completion: {
            finished in
        })
    }

}
