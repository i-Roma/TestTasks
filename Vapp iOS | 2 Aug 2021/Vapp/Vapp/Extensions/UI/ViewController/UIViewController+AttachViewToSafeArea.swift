//
//  UIViewController+AttachViewToSafeArea.swift
//

import UIKit

extension UIViewController {
    
    func attachViewToSafeArea(_ attachingView: UIView, sameColorForView: Bool = true, isTopSafe: Bool = true, isBottomSafe: Bool = true) {
        attachingView.translatesAutoresizingMaskIntoConstraints = false
        if sameColorForView { view.backgroundColor = attachingView.backgroundColor }
        view.addSubview(attachingView)
        
        let topAnchor: NSLayoutYAxisAnchor = isTopSafe ? view.safeTopAnchor : view.topAnchor
        let bottoAnchor: NSLayoutYAxisAnchor = isBottomSafe ? view.safeBottomAnchor : view.bottomAnchor
        
        let constraints: [NSLayoutConstraint] = [
            attachingView.topAnchor.constraint(equalTo: topAnchor),
            attachingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            attachingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            attachingView.bottomAnchor.constraint(equalTo: bottoAnchor)
        ]
        
        view.removeConstraints(constraints)
        attachingView.removeConstraints(constraints)
        NSLayoutConstraint.activate(constraints)
    }
    
}
