//
//  NavigationAssistant.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

class NavigationAssistant {
    
    static let application = UIApplication.shared.delegate as? AppDelegate
    
    static func prepareWindow() -> UIWindow? {
        application?.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = application?.window else { return nil }
        return window
    }
    
    static func setRoot(_ viewController: UIViewController) {
        guard let window = prepareWindow() else { return }
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    static func transition(to viewController: UIViewController, animated: Bool = true, duration: Double = 0.25, options: UIView.AnimationOptions = []) {
        guard let window = application?.window else { return }
        
        if animated {
            
            var option: UIView.AnimationOptions = .transitionCrossDissolve
            if options != [] {
                option = options
            }
            
            UIView.transition(with: window, duration: duration, options: option, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                
                let oldVC = window.rootViewController
                window.rootViewController = viewController
                oldVC?.dismiss(animated: false, completion: nil)
                UIView.setAnimationsEnabled(oldState)
            })
            
        } else {
            window.rootViewController?.dismiss(animated: false, completion: nil)
            window.rootViewController = viewController
        }
    }
    
}

