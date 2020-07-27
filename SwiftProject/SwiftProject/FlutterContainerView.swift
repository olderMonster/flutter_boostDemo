//
//  FLutterContainerView.swift
//  SwiftProject
//
//  Created by monster on 2020/7/24.
//  Copyright © 2020 monster. All rights reserved.
//

import UIKit
import flutter_boost


class FlutterContainerView: FLBFlutterViewContainer {

    override init() {
        super.init()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var statusBarStyle: UIStatusBarStyle = .darkContent {
        didSet {
            //外部传入状态栏样式后刷新UI更新样式
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    
    //MARK: public method
    /// 更新状态栏样式
    /// - Parameter styleValue: 状态栏样式原始值(0-默认样式：黑色文本、1-亮色样式：白色文本、2：黑色样式：黑色文本)
    @objc public class func updateStatusBarStyle(styleValue: Int) {
        guard let style = UIStatusBarStyle(rawValue: styleValue) else {
            return
        }
        let topVC = FlutterBoostPlugin.sharedInstance().currentViewController()
        guard topVC is FlutterContainerView else {
            return
        }
        let containerVC = topVC as! FlutterContainerView
        containerVC.statusBarStyle = style
        
    }

}
