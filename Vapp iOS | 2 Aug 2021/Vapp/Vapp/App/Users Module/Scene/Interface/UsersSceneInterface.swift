//
//  UsersSceneInterface.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

protocol UsersSceneInterface: AnyObject {
    func showAlert(with message: String)
    func requestStarted()
    func requestFinished()
    func requestSuccess()
    func requestFailed(with reason: String)
    func startedLoadMoreData()
    func finishedLoadMoreData()
    func loadMoreSuccess(for indexPathes: [IndexPath])
    func fetchedDataDetails(fetchedUsers: String, of totalUsers: String, _ isTheEnd: Bool)
}
