//
//  UsersCellImageContainer.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

class UsersCellImageContainer: UIView {
    
    // MARK: Property
    
    var loadImageTask: URLSessionDataTask?
    let imageView = UIImageView()
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        configView()
    }
    
    override func layoutSubviews() {
        addImageViewConstraints()
    }
    
    // MARK: Methods
    
    private func settings() {
        backgroundColor = Palette.primary.backgroundColor
    }
    
    private func configView() {
        addImageView()
    }
    
    // Image view
    
    private func addImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = Palette.primary.gray
        imageView.corner(radius: 8)
        addSubview(imageView)
    }
    
    private func addImageViewConstraints() {
        imageView.anchor(
            top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,
            padding: .init(top: 8, left: 8, bottom:8, right: 8)
        )
    }
    
}
