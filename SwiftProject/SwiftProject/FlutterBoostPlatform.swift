//
//  FlutterBoostRouter.swift
//  SwiftProject
//
//  Created by monster on 2020/7/24.
//  Copyright © 2020 monster. All rights reserved.
//

import Foundation
import flutter_boost

class FlutterBoostPlatform:NSObject, FLBPlatform {
    
    //Push
    func open(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        
        //Flutter跳转Native
        if url == "detail" {
            let vc = DetailViewController()
            vc.navigationItem.title = (urlParams["title"] as! String)
            self.navigationController()?.pushViewController(vc, animated: true)
        }else {
            //Native跳转Flutter
            let container = FlutterContainerView()
            container.setName(url, params: urlParams)
            self.navigationController()?.pushViewController(container, animated: true)
        }
        
    }
    
    
    func present(_ url: String, urlParams: [AnyHashable : Any], exts: [AnyHashable : Any], completion: @escaping (Bool) -> Void) {
        
        if url == "login" {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.navigationItem.title = (urlParams["title"] as! String)
            self.navigationController()?.present(nav, animated: true, completion: nil)
            
        }else {
            
            var animated = false;
            if exts["animated"] != nil{
                animated = exts["animated"] as! Bool;
            }
            
            let vc = FLBFlutterViewContainer.init();
            vc.setName(url, params: urlParams);
            self.navigationController()?.present(vc, animated: animated) {
                completion(true);
            };
        }

        
    }
    
    func navigationController() -> UINavigationController? {
        
        guard let scene = UIApplication.shared.connectedScenes.first else {
            return nil
        }
        guard let delegate = scene.delegate as! SceneDelegate? else { return nil }
        guard let window = delegate.window else { return nil }
        guard let rootVC = window.rootViewController else { return nil }
        guard rootVC is UINavigationController else { return nil }
        return (rootVC as! UINavigationController)
    }
}
