//
//  UsersTableView.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

class UsersTableView: TableView {
    
    // MARK: Constants
    
    static var headerHeight: CGFloat = 190
    static var cellHeight: CGFloat = 98
    
    // MARK: Public property
    
    override var state: TableViewState {
        didSet {
            
            switch state {
            case .fetching:
                startSpiner()
            case .fetched:
                reloadData()
                header.titleLabel.text = header.informTitle
                stopSpiner()
            case .noData:
                header.titleLabel.text = state.rawValue
                stopSpiner()
            case .failure:
                header.titleLabel.text = state.rawValue
                stopSpiner()
            }
        }
    }
    
    let header = UsersTableViewHeader()
    
    // MARK: Private property
    
    private var spinner = UIActivityIndicatorView(style: .medium)
    
    // MARK: Life cycle
    
    required init(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        addHeader()
    }
    
    override func settings() {
        backgroundColor = Palette.primary.backgroundColor
    }
    
    override func registerCells() {
        register(UsersCell.self, forCellReuseIdentifier: UsersCell.id)
    }
    
    // Header
    
    private func addHeader() {
        header.frame = CGRect(x: .zero, y: .zero, width: bounds.width, height: UsersTableView.headerHeight)
        tableHeaderView = header
    }
    
    // Footer
    
    func addSpinner() {
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        spinner.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60)
        spinner.backgroundColor = Palette.secondary.gray
        tableFooterView = spinner
    }
    
    func hideSpinner() {
        tableFooterView = nil
    }
}
