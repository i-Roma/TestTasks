//
//  UsersCellButton.swift
//  Vapp
//
//  Created by Roman Home on 23.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import UIKit

protocol UsersCellFavButtonDelegate: AnyObject {
    func usersCellFavButtonDidTap(_ isSelected: Bool)
}

class UsersCellFavButton: UIButton {
    
    // MARK: Delegate
    
    weak var delegate: UsersCellFavButtonDelegate?
    
    var active: Bool = false {
        didSet {
            if active {
                setImage(UIImage(systemName: "star.fill")!, for: .normal)
            } else {
                setImage(UIImage(systemName: "star")!, for: .normal)
            }
        }
    }
    
    // MARK: Life Cycle
    
    override func draw(_ rect: CGRect) {
        addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    // MARK: Methods
    
    func setState(isSelected: Bool = false) {
        active = isSelected
    }

    // MARK: Action
    
    @objc func onPress() {
        active = !active
        setState(isSelected: active)
        delegate?.usersCellFavButtonDidTap(active)
    }
    
}
