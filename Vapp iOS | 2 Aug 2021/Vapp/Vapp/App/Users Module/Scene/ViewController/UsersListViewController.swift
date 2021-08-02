//
//  BooksListViewController.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
    
    // MARK: View's Dependencies
    
    var interactor: UsersListBusinessLogic!
    /// Router not used but I left here as an example
    var router: UsersListRouterProtocols?
    
    // MARK: Properties
    
    private let mainView = UsersListMainView(frame: UIScreen.main.bounds)
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = UsersListTabBar.users.title
        becomeDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        attachViewToSafeArea(mainView)
    }
    
    // MARK: Methods
    
    private func becomeDelegates() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.usersListTabBarDelegate = self
    }
}

// MARK: - Interface -

extension UsersListViewController: UsersSceneInterface {

    func showAlert(with message: String) {
        super.showAlert(with: message)
    }
    
    func requestStarted() {
        mainView.tableView.state = .fetching
        mainView.tableView.startSpiner()
    }
    
    func requestFinished() {
        mainView.tableView.stopSpiner()
    }
    
    func requestSuccess() {
        mainView.tableView.state = .fetched
    }
    
    func requestFailed(with reason: String) {
        mainView.tableView.state = .failure
    }
    
    func fetchedDataDetails(fetchedUsers: String, of totalUsers: String, _ isTheEnd: Bool) {
        mainView.configInfoLabel(fetchedUsers, totalUsers, isTheEnd)
    }
    
}

// MARK: - Pagination stuff -

extension UsersListViewController {
    
    func startedLoadMoreData() {
        mainView.tableView.addSpinner()
    }
    
    func finishedLoadMoreData() {
        mainView.tableView.hideSpinner()
    }
    
    func loadMoreSuccess(for indexPathes: [IndexPath]) {
        mainView.tableView.insertRows(at: indexPathes, with: .none)
    }
    
}

// MARK: - UITableViewDataSource -

extension UsersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersCell.id, for: indexPath) as? UsersCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.configCell(with: interactor.userList[indexPath.row])
        
        return cell
    }
    
    // MARK: Scrolling down + pagination
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        guard interactor.isDataLoading == false else { return }
        mainView.tableView.handleScrollForPagination(scrollView) {
            interactor.fetchMoreData()
        }
    }
    
}

// MARK: - TableViewRefreshDataDelegate -

extension UsersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UsersTableView.headerHeight
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UsersTableView.cellHeight
    }
    
}

// MARK: UsersCellDelegate

extension UsersListViewController: UsersCellDelegate {
    
    func usersCellButtonDidTap(_ isSelected: Bool, from cell: UsersCell) {
        if let id = cell.id {
            interactor.toogleFavorites(at: id, isSelected: isSelected)
        }
    }
    
}

// MARK: 

extension UsersListViewController: UsersListTabBarDelegate {
    
    func usersTabBarDidSelect(tab: UsersListTabBar) {
        navigationItem.title = tab.title
        interactor.displayAppropriateDataSource(for: tab)
    }
    
}
