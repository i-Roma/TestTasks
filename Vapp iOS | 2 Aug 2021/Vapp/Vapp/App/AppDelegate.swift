//
//  AppDelegate.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configLaunchScene()
        
        return true
    }
    
    func configLaunchScene() {
        let scene = UsersListViewController()
        UsersSceneConfigurator.configure(scene)
        
        let navController = UINavigationController(rootViewController: scene)
        navController.navigationBar.prefersLargeTitles = true
        NavigationAssistant.setRoot(navController)
    }

}

