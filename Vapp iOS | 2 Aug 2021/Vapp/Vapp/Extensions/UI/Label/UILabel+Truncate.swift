//
//  UILabel+IntrinsicContentSize.swift
//

import UIKit

extension UILabel {
    
    func truncate() {
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
        adjustsFontSizeToFitWidth = false
    }
    
}
