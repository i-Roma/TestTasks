//
//  UsersTableViewHeader.swift
//  Vapp
//
//  Created by Roman Romanenko on 10/2/19.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

class UsersTableViewHeader: UIView {
    
    // MARK: Properties
    
    var title: String? {
        didSet {
            titleLabel.text = "Users"
        }
    }
    
    var informTitle = "This header adds extra height that pagination could be demonstrated"
    
    var titleLabel = UILabel()
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        addTitleLabel()
    }
    
    override func layoutSubviews() {
        setTitleLabelFrame()
    }
    
    // MARK: Methods
    
    private func settings() {
        backgroundColor = Palette.primary.gray
    }
    
    // Title label
    
    private func addTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.textColor = Palette.primary.text.title
        titleLabel.font = UIFont(name: Font.primary.light, size: 20)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        addSubview(titleLabel)
    }
    
    private func setTitleLabelFrame() {
        titleLabel.anchor(
            top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,
            padding: .init(onePadding: 20)
        )
    }
    
    
}
