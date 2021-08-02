//
//  UIView+AutoLayout.swift
//

import UIKit

typealias Anchors = (top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?)

extension UIView {
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero)
        -> (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?, leading: NSLayoutConstraint?, trailing: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?) {
            
        translatesAutoresizingMaskIntoConstraints = false
        
        var hasSetTopAnchor: NSLayoutConstraint?
        var hasSetLeadingAnchor: NSLayoutConstraint?
        var hasSetBottomAnchor: NSLayoutConstraint?
        var hasSetTrailingAnchor: NSLayoutConstraint?
        var hasSetWidth: NSLayoutConstraint?
        var hasSetHeight: NSLayoutConstraint?
        
        var constraints: (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?, leading: NSLayoutConstraint?, trailing: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?)
        
        if let top = top {
            hasSetTopAnchor = topAnchor.constraint(equalTo: top, constant: padding.top)
            hasSetTopAnchor?.isActive = true
            constraints.top = hasSetTopAnchor
        }
        
        if let leading = leading {
            hasSetLeadingAnchor = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            hasSetLeadingAnchor?.isActive = true
            constraints.leading = hasSetLeadingAnchor
        }
        
        if let bottom = bottom {
            hasSetBottomAnchor = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
            hasSetBottomAnchor?.isActive = true
            constraints.bottom = hasSetBottomAnchor
        }
        
        if let trailing = trailing {
            hasSetTrailingAnchor = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
            hasSetTrailingAnchor?.isActive = true
            constraints.trailing = hasSetTrailingAnchor
        }
        
        if size.width != 0 {
            hasSetWidth = widthAnchor.constraint(equalToConstant: size.width)
            hasSetWidth?.isActive = true
            constraints.width = hasSetWidth
        }
        
        if size.height != 0 {
            hasSetHeight = heightAnchor.constraint(equalToConstant: size.height)
            hasSetHeight?.isActive = true
            constraints.height = hasSetHeight
        }
            
        return constraints
    }
    
    func centerXRegarding(to centerOfView: NSLayoutXAxisAnchor) {
        centerXAnchor.constraint(equalTo: centerOfView).isActive = true
    }
    
    func centerYRegarding(to centerOfView: NSLayoutYAxisAnchor) {
        centerYAnchor.constraint(equalTo: centerOfView).isActive = true
    }
    
    @discardableResult
    func anchor(to view: UIView, padding: UIEdgeInsets = .zero)
        -> (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?, leading: NSLayoutConstraint?, trailing: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?) {
            
        translatesAutoresizingMaskIntoConstraints = false
        
        var hasSetTopAnchor: NSLayoutConstraint?
        var hasSetLeadingAnchor: NSLayoutConstraint?
        var hasSetBottomAnchor: NSLayoutConstraint?
        var hasSetTrailingAnchor: NSLayoutConstraint?
        
        var constraints: (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?, leading: NSLayoutConstraint?, trailing: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?)
        
        let top = view.topAnchor
        hasSetTopAnchor = topAnchor.constraint(equalTo: top, constant: padding.top)
        hasSetTopAnchor?.isActive = true
        constraints.top = hasSetTopAnchor

        let leading = view.leadingAnchor
        hasSetLeadingAnchor = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        hasSetLeadingAnchor?.isActive = true
        constraints.leading = hasSetLeadingAnchor
        
        let bottom = view.bottomAnchor
        hasSetBottomAnchor = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        hasSetBottomAnchor?.isActive = true
        constraints.bottom = hasSetBottomAnchor
        
        let trailing = view.trailingAnchor
        hasSetTrailingAnchor = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        hasSetTrailingAnchor?.isActive = true
        constraints.trailing = hasSetTrailingAnchor
            
        return constraints
    }
    
}

extension UIView {
    
    enum AnchorDirection {
        case none
        case top
        case left
        case bottom
        case right
        
    }
    
    @discardableResult
    func setView(anchors: Anchors? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero)
        -> (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?, leading: NSLayoutConstraint?, trailing: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?) {
            
        translatesAutoresizingMaskIntoConstraints = false
        
        var hasSetTopAnchor: NSLayoutConstraint?
        var hasSetLeadingAnchor: NSLayoutConstraint?
        var hasSetBottomAnchor: NSLayoutConstraint?
        var hasSetTrailingAnchor: NSLayoutConstraint?
        var hasSetWidth: NSLayoutConstraint?
        var hasSetHeight: NSLayoutConstraint?
        
        var constraints: (top: NSLayoutConstraint?, bottom: NSLayoutConstraint?, leading: NSLayoutConstraint?, trailing: NSLayoutConstraint?, width: NSLayoutConstraint?, height: NSLayoutConstraint?)
        
        if let top = anchors?.top {
            hasSetTopAnchor = topAnchor.constraint(equalTo: top, constant: padding.top)
            hasSetTopAnchor?.isActive = true
            constraints.top = hasSetTopAnchor
        }
        
        if let leading = anchors?.leading {
            hasSetLeadingAnchor = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            hasSetLeadingAnchor?.isActive = true
            constraints.leading = hasSetLeadingAnchor
        }
        
        if let bottom = anchors?.bottom {
            hasSetBottomAnchor = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
            hasSetBottomAnchor?.isActive = true
            constraints.bottom = hasSetBottomAnchor
        }
        
        if let trailing = anchors?.trailing {
            hasSetTrailingAnchor = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
            hasSetTrailingAnchor?.isActive = true
            constraints.trailing = hasSetTrailingAnchor
        }
        
        if size.width != 0 {
            hasSetWidth = widthAnchor.constraint(equalToConstant: size.width)
            hasSetWidth?.isActive = true
            constraints.width = hasSetWidth
        }
        
        if size.height != 0 {
            hasSetHeight = heightAnchor.constraint(equalToConstant: size.height)
            hasSetHeight?.isActive = true
            constraints.height = hasSetHeight
        }
            
        return constraints
    }
    
}


extension UIEdgeInsets {
    
    init(onePadding: CGFloat = 0) {
        self.init(top: onePadding, left: onePadding, bottom: onePadding, right: onePadding)
    }
    
}

extension CGSize {
    
    init(width: CGFloat) {
        self.init(width: width, height: 0)
    }
    
    init(height: CGFloat) {
        self.init(width: 0, height: height)
    }
    
}
