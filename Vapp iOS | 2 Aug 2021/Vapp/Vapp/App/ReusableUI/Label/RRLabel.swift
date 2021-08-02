//
//  SubtitleLabel.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

class RRLabel: UILabel {
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        truncate()
        textColor = Palette.primary.text.subtitle
        font = UIFont(name: Font.primary.medium, size: 18)
    }
    
}

extension RRLabel {

    var fontSize: CGFloat {
        get {
            return font?.pointSize ?? UIFont.labelFontSize
        }
        set(value) {
            font = font?.withSize(value) ?? UIFont.systemFont(ofSize: value)
        }
    }
    
    var fontFamily: String {
        get {
            return font.familyName
        }
        set(value) {
            font = UIFont(name: value, size: fontSize)
        }
    }
    
}
