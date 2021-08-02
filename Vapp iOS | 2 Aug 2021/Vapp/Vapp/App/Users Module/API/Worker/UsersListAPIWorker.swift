//
//  UsersListAPIWorker.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

protocol UsersListAPIWorkerInterface {
    var lastCursor: Int? { get }
    var nextCursor: Int? { get }
    var totalPages: Int? { get }
    var totalItems: Int? { get }
    var fetchedDataCount: Int { get }
    var isLoading: Bool { get }
    func loadData()
    func loadMoreData()
}

final class UsersListAPIWorker: UsersListAPIWorkerInterface {
    
    // MARK: Delegate
    
    weak var delegate: UsersListAPIWorkerFetchResult?
    
    // MARK: Properties
    
    var requestTask: URLSessionDataTask?
    
    var fetchedDataCount: Int {
        return fetchedDataDict.count
    }
    
    var fetchedDataAsArray: [UsersListItem] {
        return fetchedDataDict.valuesArray
    }
    
    // MARK: Private properties
        
    private let apiProvider = URLSessionProvider()
    private(set) var lastCursor: Int?
    private(set) var nextCursor: Int?
    private(set) var totalPages: Int?
    private(set) var totalItems: Int?
    private(set) var isLoading = false
    private(set) var fetchedDataDict: [Int : UsersListItem] = [:]
    
    // MARK: Life cycle
    
    init(delegate: UsersListAPIWorkerFetchResult?) {
        self.delegate = delegate
    }
    
    // MARK: Methods
    
    func getElement(at index: Int) -> UsersListItem? {
        return fetchedDataAsArray.getElement(at: index)
    }
    
    // MARK: Private methods
    
    func loadData() {
        delegate?.onFetchDataStarted()
        
        let apiService = FetchUsersAPIService.queryUsers
        requestTask = apiProvider.request(from: apiService, responseType: UsersListResponseModel.self) { response in
            self.delegate?.onFetchDataFinished()
            
            switch response {
            case let .success(result):
                                
                result.data.forEach { item in
                    self.fetchedDataDict[item.id] = item
                }
                
                self.lastCursor = result.page
                self.totalPages = result.totalPages
                self.totalItems = result.total
                
                if result.page < result.totalPages {
                    self.nextCursor = result.page + 1
                }
                
                DispatchQueue.main.async {
                    self.delegate?.onFetchDataCompleted(with: result)
                }
                
            case let .failure(error):
                self.delegate?.onFetchDataFailed(with: error.rawValue)
            }
        }
    }
    
    func loadMoreData() {
        
        guard let cursor = self.nextCursor, cursor != 0 else {
            self.delegate?.onFetchMoreDataFinished()
            return
        }

        isLoading = true
        delegate?.onFetchMoreDataStarted()

        let apiService = FetchUsersAPIService.queryMoreUsers(page: cursor)
        requestTask = apiProvider.request(from: apiService, responseType: UsersListResponseModel.self) { response in
            
            switch response {
            case let .success(result):
                
                var indexPaths: [IndexPath] = []
                
                result.data.forEach {
                    self.fetchedDataDict[$0.id] = $0
                    let indexPath = IndexPath(row: self.fetchedDataCount - 1, section: 0)
                    indexPaths.append(indexPath)
                }
            
                self.nextCursor = result.page + 1
                
                DispatchQueue.main.async {
                    self.delegate?.onFetchMoreDataFinished()
                    self.delegate?.onFetchMoreDataCompleted(for: indexPaths)
                    self.isLoading = false
                }
                
            case let .failure(error):
                self.delegate?.onFetchDataFailed(with: error.rawValue)
            }
        }
    }
    
}
