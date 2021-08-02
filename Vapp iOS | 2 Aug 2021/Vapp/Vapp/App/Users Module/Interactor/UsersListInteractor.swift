//
//  UsersListInteractor.swift
//  Vapp
//
//  Created by Roman Home on 26.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import Foundation

// MARK: Business logic

protocol UsersListBusinessLogic {
    var userList: [UsersListItem] { get }
    var isDataLoading: Bool { get }
    func fetchFirstData()
    func fetchMoreData()
    func cancelFetchingData()
    func toogleFavorites(at id: Int, isSelected: Bool)
    func displayAppropriateDataSource(for tab: UsersListTabBar)
}

/// Not used but I left here as an example
protocol UsersListDataStore {
    // Define data to be shared
}

// MARK: - Implementation -

final class UsersListInteractor: UsersListBusinessLogic {
    
    // MARK: Interface
    
    var presenter: UsersListPresenter?
    
    // MARK: Data models
    
    private var apiWorker: UsersListAPIWorker!
    
    // MARK: Properties
    
    var userList: [UsersListItem] {
        let list = apiWorker.fetchedDataAsArray.sorted { $0.firstName < $1.firstName}
        switch selectedATabBarItem {
        case .users:
            return list
        case .favorite:
            return list.filter { $0.isSelected }
        }
    }
    
    var isDataLoading: Bool {
        return apiWorker.isLoading
    }
    
    private(set) var selectedATabBarItem: UsersListTabBar = .users

    // MARK: Life cycle
    
    init() {
        apiWorker = UsersListAPIWorker(delegate: self)
        fetchFirstData()
    }
    
    // MARK: Methods
    
    func fetchFirstData() {
        presenter?.onFetchDataStarted()
        apiWorker.loadData()
    }
    
    func fetchMoreData() {
        guard selectedATabBarItem == .users else { return }
        apiWorker.loadMoreData()
    }
    
    func cancelFetchingData() {
        apiWorker.requestTask?.cancel()
    }

    func toogleFavorites(at id: Int, isSelected: Bool) {
        apiWorker.fetchedDataDict[id]?.isSelected = isSelected
        if !isSelected { presenter?.onCompleted() }
    }
        
    func displayAppropriateDataSource(for tab: UsersListTabBar) {
        selectedATabBarItem = tab
        presenter?.onCompleted()
    }
    
    func fetchedDataDetails() {
        guard let totalUesrs = apiWorker.totalItems else { return }
        let isTheEnd = totalUesrs == apiWorker.fetchedDataCount
        presenter?.fetchedDataDetails(fetchedUsers: apiWorker.fetchedDataCount, of: totalUesrs, isTheEnd)
    }
    
}

// MARK: - Regular data model delegate

extension UsersListInteractor: UsersListAPIWorkerFetchResult {
    
    func onFetchDataStarted() {
        presenter?.onFetchDataStarted()
    }
    
    func onFetchDataFinished() {
        presenter?.onFetchDataFinished()
    }
    
    func onFetchDataFailed(with reason: String) {
        presenter?.onFetchDataFailed(with: reason)
    }
    
    func onFetchDataCompleted(with result: UsersListResponseModel) {
        fetchedDataDetails()
        presenter?.onCompleted()
    }
    
}

// MARK: Pagination handling

extension UsersListInteractor {
    
    func onFetchMoreDataStarted() {
        presenter?.onFetchMoreDataStarted()
    }
    
    func onFetchMoreDataFinished() {
        presenter?.onFetchMoreDataFinished()
    }
    
    func onFetchMoreDataCompleted(for indexPathes: [IndexPath]) {
        fetchedDataDetails()
        presenter?.onFetchMoreDataCompleted(for: indexPathes)
    }
    
    func onFetchMoreDataFailed(with reason: String) {
        presenter?.onFetchMoreDataFailed(with: reason)
    }
    
}

