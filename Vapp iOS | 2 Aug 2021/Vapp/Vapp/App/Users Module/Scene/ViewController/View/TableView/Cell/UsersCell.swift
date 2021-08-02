//
//  UsersCell.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

protocol UsersCellDelegate: AnyObject {
    func usersCellButtonDidTap(_ isSelected: Bool, from cell: UsersCell)
}

class UsersCell: UITableViewCell {
    
    // MARK: Delegates
    
    weak var delegate: UsersCellDelegate?
    
    // MARK: Private properties
    
    var id: Int?
    private var imageContainer = UsersCellImageContainer()
    private var labesContainer = UsersCellLabesContainer()
    private var favoriteContainer = UsersCellButtonContainer()

    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageContainer.loadImageTask?.cancel()
        imageContainer.imageView.image = nil
        labesContainer.firstNameLabel.text = nil
        labesContainer.lastNameLabel.text = nil
        favoriteContainer.favoriteButton.setState()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        settings()
        configComponents()
    }
    
    override func layoutSubviews() {
        configComponentsFrames()
        addCustomSeparator()
    }
    
    // MARK: Methods
    
    private func settings() {
        selectionStyle = .none
        backgroundColor = Palette.primary.backgroundColor
    }
    
    private func configComponents() {
        addImageContainer()
        addFavoriteButton()
        addLabesContainer()
    }
    
    private func configComponentsFrames() {
        setImageContainerFrame()
        setFavoriteButtonFrame()
        setLabesContainerFrame()
    }
    
    private func addCustomSeparator() {
        let border = createBorder(
            side: .bottom,
            thickness: 1,
            color: Palette.primary.gray,
            leftOffset: 8
        )
        layer.addSublayer(border)
    }
    
    // ImageContainer
    
    private func addImageContainer() {
        contentView.addSubview(imageContainer)
    }
    
    private func setImageContainerFrame() {
        let width: CGFloat = bounds.height
        let height: CGFloat = bounds.height
        let x: CGFloat = .zero
        let y: CGFloat = .zero
        imageContainer.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    // Favorite button
    
    private func addFavoriteButton() {
        favoriteContainer.favoriteButton.delegate = self
        contentView.addSubview(favoriteContainer)
    }
    
    private func setFavoriteButtonFrame() {
        favoriteContainer.anchor(
            top: nil, leading: nil, bottom: nil, trailing: trailingAnchor,
            size: .init(width: 64, height: 64)
        )
        favoriteContainer.centerYRegarding(to: centerYAnchor)
    }
    
    // Labes container
    
    private func addLabesContainer() {
        contentView.addSubview(labesContainer)
    }
    
    private func setLabesContainerFrame() {
        labesContainer.anchor(
            top: nil, leading: imageContainer.trailingAnchor, bottom: nil, trailing: favoriteContainer.leadingAnchor,
            padding: .init(top: 0, left: 8, bottom: 0, right: 8),
            size: .init(height: bounds.height * 0.45)
        )
        labesContainer.centerYRegarding(to: centerYAnchor)
    }
}

// MARK: Config cell

extension UsersCell: UsersCellInterface {
    
    func configCell(with obj: UsersListItem) {
        
        id = obj.id
        imageContainer.loadImageTask = imageContainer.imageView.loadImageUsingCache(withUrl: obj.avatar)
        labesContainer.firstName = obj.firstName
        labesContainer.lastName = obj.lastName
        favoriteContainer.favoriteButton.setState(isSelected: obj.isSelected)
    }
    
}

// MARK: Favorite button

extension UsersCell: UsersCellFavButtonDelegate {
    
    func usersCellFavButtonDidTap(_ isSelected: Bool) {
        delegate?.usersCellButtonDidTap(isSelected, from: self)
    }
    
}
