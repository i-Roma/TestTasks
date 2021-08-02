//
//  UsersListDataModelDelegte.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

protocol UsersListAPIWorkerFetchData: AnyObject {
    func onFetchDataStarted()
    func onFetchDataCompleted(with result: UsersListResponseModel)
    func onFetchDataFailed(with reason: String)
    func onFetchDataFinished()
}

protocol UsersListAPIWorkerFetchMoreData: AnyObject {
    func onFetchMoreDataStarted()
    func onFetchMoreDataCompleted(for indexPathes: [IndexPath])
    func onFetchMoreDataFailed(with reason: String)
    func onFetchMoreDataFinished()
}

typealias UsersListAPIWorkerFetchResult = UsersListAPIWorkerFetchData & UsersListAPIWorkerFetchMoreData
