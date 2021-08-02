//
//  UsersCellLabesContainer.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

class UsersCellLabesContainer: UIView {
    
    // MARK: Properties
    
    var firstName: String? {
        didSet {
            if let firstName = firstName, !firstName.isEmpty {
                firstNameLabel.text = firstName
            } else {
                firstNameLabel.text = "Name undefined"
            }
        }
    }
    
    var lastName: String? {
        didSet {
            
            if let lastName = lastName, !lastName.isEmpty {
                lastNameLabel.text = lastName.capitalized
            } else {
                lastNameLabel.text = "Lastname undefined"
            }
        }
    }
    
    // MARK: Private properties
    
    var firstNameLabel = RRLabel()
    var lastNameLabel = RRLabel()
    
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
        configViewFrames()
    }
    
    // MARK: Methods
    
    func resetLabesValues() {
        firstNameLabel.text = nil
        lastNameLabel.text = nil
    }
    
    // MARK: Private methods
    
    private func settings() {
        backgroundColor = Palette.primary.backgroundColor
    }
    
    private func configView() {
        addFirstNameLabel()
        addLastNameLabel()
    }
    
    private func configViewFrames() {
        setFirstNameLabelFrame()
        setLastNameLabelFrame()
    }
    
    // First name label
    
    private func addFirstNameLabel() {
        firstNameLabel.truncate()
        firstNameLabel.fontFamily = Font.primary.bold
        firstNameLabel.textColor = Palette.primary.text.title
        addSubview(firstNameLabel)
    }
    
    private func setFirstNameLabelFrame() {
        firstNameLabel.anchor(
            top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            size: .init(width: 0, height: bounds.height * 0.5)
        )
    }
    
    // Last name label
    
    private func addLastNameLabel() {
        addSubview(lastNameLabel)
    }
    
    private func setLastNameLabelFrame() {
        lastNameLabel.anchor(
            top: firstNameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor
        )
    }
    
}
