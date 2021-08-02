//
//  UsersCellButtonContainer.swift
//  Vapp
//
//  Created by Roman Home on 23.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import UIKit

class UsersCellButtonContainer: UIView {
    
    // MARK: Property
    
    var favoriteButton = UsersCellFavButton()
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        addFavoriteButton()
    }
    
    override func layoutSubviews() {
        setFavoriteButtonFrame()
        super.layoutSubviews()
    }

    // MARK: Methods
    
    private func settings() {
        backgroundColor = Palette.primary.backgroundColor
    }

    // Favorite button
    
    private func addFavoriteButton() {
        addSubview(favoriteButton)
    }
    
    private func setFavoriteButtonFrame() {
        favoriteButton.anchor(
            top: nil, leading: nil, bottom: nil, trailing: nil,
            size: .init(width: 64, height: 64)
        )
        centerXRegarding(to: centerXAnchor)
        centerYRegarding(to: centerYAnchor)
    }
    
}

