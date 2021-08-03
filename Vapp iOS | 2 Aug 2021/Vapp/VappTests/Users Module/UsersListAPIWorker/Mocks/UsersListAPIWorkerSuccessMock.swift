//
//  UsersListAPIWorkerSuccessMock.swift
//  VappTests
//
//  Created by Roman Home on 27.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import XCTest
@testable import Vapp

class UsersListAPIWorkerSuccessMock: UsersListAPIWorkerInterface {
    var totalItems: Int?
    var lastCursor: Int? = 2
    var nextCursor: Int? = 2
    var totalPages: Int? = 12
    var fetchedDataCount: Int = 6
    var isLoading = false
    func loadData() {}
    func loadMoreData() {}
}
