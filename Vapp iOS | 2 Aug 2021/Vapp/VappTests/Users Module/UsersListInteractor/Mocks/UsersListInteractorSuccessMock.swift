//
//  UsersListInteractorSuccessMock.swift
//  VappTests
//
//  Created by Roman Home on 27.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import XCTest
@testable import Vapp

class UsersListInteractorSuccessMock: UsersListBusinessLogic {
    var userList: [UsersListItem] = [UsersListItem.dummyData]
    var isDataLoading: Bool = false
    func fetchFirstData() {}
    func fetchMoreData() {}
    func cancelFetchingData() {}
    func toogleFavorites(at id: Int, isSelected: Bool) {}
    func displayAppropriateDataSource(for tab: UsersListTabBar) {}
}
