//
//  TableView.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

enum TableViewState: String {
    case fetching = "Fetching..."
    case fetched = ""
    case failure = "Failure fetching data"
    case noData = "No data for your request \u{1F614}"
}

class TableView: UITableView {
    
    // MARK: Public  property
    
    var state: TableViewState = .fetching
    
    // MARK: Private property
    
    private var spinner = UIActivityIndicatorView.init(style: .medium)
    
    // MARK: Life cycle
    
    required init(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        settings()
        registerCells()
        tableViewSettings()
        addSpiner()
    }

    /* Overrideable */

    func settings() {}
    func registerCells() {}
    
    // MARK: Method
    
    func startSpiner() {
        spinner.startAnimating()
    }
    
    func stopSpiner() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
        }
    }
    
    // MARK: Private method
    
    private func tableViewSettings() {
        separatorColor = .clear
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func addSpiner() {
        spinner.hidesWhenStopped = true
        self.addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}

extension TableView {
    
    func handleScrollForPagination(_ scrollView: UIScrollView, loadMore: () -> Swift.Void) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.bounds
        let size = scrollView.contentSize
        let inset = scrollView.contentInset
        
        let y = offset.y + bounds.size.height - inset.bottom
        let h = size.height
        
        let reloadDistance = CGFloat(30.0)
        if y > h + reloadDistance {
            loadMore()
        }
    }
    
}

// MARK: Reload table view with animation

extension TableView {
    
    func reloadWithAnimation(duration: TimeInterval = 0.15, options: UIView.AnimationOptions = .transitionCrossDissolve) {
        DispatchQueue.main.async {
            UIView.transition(with: self, duration: duration, options: options, animations: {
                self.reloadData()
            })
        }
    }
    
}
