//
//  UsersListMainView.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

enum UsersListTabBar: Int {
    case users
    case favorite
    
    var title: String {
        switch self {
        case .users:
            return "Users"
        case .favorite:
            return "Favorite"
        }
    }
}

protocol UsersListTabBarDelegate: AnyObject {
    func usersTabBarDidSelect(tab: UsersListTabBar)
}

class UsersListMainView: UIView {
    
    // MARK: Delegate
    
    weak var usersListTabBarDelegate: UsersListTabBarDelegate?
    
    let tableView = UsersTableView()
    let infoLabel = RRLabel()
    let tabBar = UITabBar()
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        configView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configFrames()
    }
    
    // MARK: Methods
    
    private func settings() {
        backgroundColor = Palette.primary.backgroundColor
    }
    
    private func configView() {
        addTableView()
        addInfoLabel()
        addTabBar()
    }
    
    private func configFrames() {
        setTableViewConstraints()
        setInfoLabelConstraints()
        setTabBarConstraints()
    }
    
    // TableView
    
    private func addTableView() {
        addSubview(tableView)
    }
    
    private func setTableViewConstraints() {
        let width: CGFloat = bounds.width
        let height: CGFloat = bounds.height - tabBar.bounds.height - infoLabel.bounds.height
        let x: CGFloat = .zero
        let y: CGFloat = .zero
        tableView.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    // Label
    
    private func addInfoLabel() {
        infoLabel.fontSize = 12
        infoLabel.backgroundColor = Palette.primary.backgroundColor
        infoLabel.textColor = .systemGray2
        infoLabel.textAlignment = .center
        addSubview(infoLabel)
    }
    
    private func setInfoLabelConstraints() {
        let width: CGFloat = bounds.width
        let height: CGFloat = 20
        let x: CGFloat = .zero
        let y: CGFloat = bounds.height - height - tabBar.bounds.height
        infoLabel.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    func configInfoLabel(_ fetchedUsers: String, _ totalUsers: String, _ isTheEnd: Bool) {
        if isTheEnd {
            infoLabel.backgroundColor = .systemGreen
            infoLabel.textColor = .white
            infoLabel.text = "The End! All \(fetchedUsers) of \(totalUsers) has been fethed"
        } else {
            infoLabel.text = "\(fetchedUsers) of \(totalUsers)"
        }
    }
    
    // TabBar
    
    private func addTabBar() {

        let users = UITabBarItem(
            title: "Users",
            image: UIImage(systemName: "person")!,
            tag: UsersListTabBar.users.rawValue
        )
        
        let favorites = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "star")!,
            tag: UsersListTabBar.favorite.rawValue
        )
        
        tabBar.delegate = self
        tabBar.items = [users, favorites]
        tabBar.isTranslucent = false
        tabBar.selectedItem = users
        
        addSubview(tabBar)
    }
    
    private func setTabBarConstraints() {
        let width: CGFloat = bounds.width
        let height: CGFloat = 48
        let x: CGFloat = .zero
        let y: CGFloat = bounds.height - height
        tabBar.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
}

// MARK: - UITabBarDelegate -

extension UsersListMainView: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let usersState = {
            self.infoLabel.isHidden = false
            self.usersListTabBarDelegate?.usersTabBarDidSelect(tab: .users)
        }
        
        switch item.tag {
        case UsersListTabBar.users.rawValue:
            usersState()
        case UsersListTabBar.favorite.rawValue:
            infoLabel.isHidden = true
            usersListTabBarDelegate?.usersTabBarDidSelect(tab: .favorite)
        default:
            usersState()
        }
    }
    
}
