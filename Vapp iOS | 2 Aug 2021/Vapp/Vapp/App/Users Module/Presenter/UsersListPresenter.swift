//
//  UsersPresenter.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

protocol UsersListPresentationLogic {
    // Regular
    func onFetchDataStarted()
    func onFetchDataFailed(with reason: String)
    func onCompleted()
    func onFetchDataFinished()
    
    // Pagination
    func onFetchMoreDataStarted()
    func onFetchMoreDataCompleted(for indexPathes: [IndexPath])
    func onFetchMoreDataFailed(with reason: String)
    func onFetchMoreDataFinished()
    
    func fetchedDataDetails(fetchedUsers: Int, of totalUsers: Int, _ isTheEnd: Bool)
}


final class UsersListPresenter: UsersListPresentationLogic {
    
    // MARK: Interface
    
    weak var scene: UsersSceneInterface?
        
    // MARK: Methods
    
    func onFetchDataStarted() {
        scene?.requestStarted()
    }
    
    func onFetchDataFinished() {
        scene?.requestFinished()
    }
    
    func onFetchDataFailed(with reason: String) {
        scene?.requestFailed(with: reason)
    }
    
    func onCompleted() {
        scene?.requestSuccess()
    }
    
    func onFetchMoreDataStarted() {
        scene?.startedLoadMoreData()
    }
    
    func onFetchMoreDataFinished() {
        scene?.finishedLoadMoreData()
    }
    
    func onFetchMoreDataCompleted(for indexPathes: [IndexPath]) {
        scene?.loadMoreSuccess(for: indexPathes)
    }
    
    func onFetchMoreDataFailed(with reason: String) {
        scene?.showAlert(with: reason)
    }
    
    func fetchedDataDetails(fetchedUsers: Int, of totalUsers: Int, _ isTheEnd: Bool) {
        let fetchedUsersStr = String(fetchedUsers)
        let totalUsersStr = String(totalUsers)
        scene?.fetchedDataDetails(fetchedUsers: fetchedUsersStr, of: totalUsersStr, isTheEnd)
    }
}
