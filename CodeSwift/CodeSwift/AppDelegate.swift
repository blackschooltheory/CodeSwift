//
//  AppDelegate.swift
//  CodeSwift
//
//  Created by mac on 2021/9/6.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window: UIWindow? = UIWindow.init()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let homeVC = HomeViewControllView.init()
        let nav = UINavigationController.init(rootViewController: homeVC)
        let tab = UITabBarController.init()
        tab.viewControllers = [nav]
        
        window?.backgroundColor = .white
        window?.bounds = UIScreen.main.bounds
        window?.rootViewController = tab
        
        window?.makeKeyAndVisible()
        
        
        
        return true
    }



}

