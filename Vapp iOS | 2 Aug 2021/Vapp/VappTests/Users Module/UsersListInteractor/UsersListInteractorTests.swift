//
//  UsersListInteractorTests.swift
//  VappTests
//
//  Created by Roman Home on 27.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import XCTest
@testable import Vapp

class UsersListInteractorTests: XCTestCase {
    
    private var usersListAPIWorker: UsersListInteractor!

    override func setUpWithError() throws {
        usersListAPIWorker = UsersListInteractor()
    }

    override func tearDownWithError() throws {
        usersListAPIWorker = nil
    }

    func test_unsuccessfull_load_data() throws {
        let mock = UsersListInteractorFailMock()

        // When
        mock.fetchFirstData()

        // Then
        XCTAssertEqual(mock.userList.count, 0)
    }
    
    func test_successfull_load_data() throws {
        let mock = UsersListInteractorSuccessMock()
        
        // When
        mock.fetchFirstData()

        // Then
        XCTAssertGreaterThanOrEqual(mock.userList.count, 0)
    }
    
    func test_unsuccessfull_load_more_data() throws {
        let mock = UsersListInteractorFailMock()

        // When
        mock.fetchMoreData()

        // Then
        XCTAssertEqual(mock.userList.count, 0)
    }
    
    func test_successfull_load_more_data() throws {
        let mock = UsersListInteractorSuccessMock()
        
        // When
        mock.fetchMoreData()

        // Then
        XCTAssertGreaterThanOrEqual(mock.userList.count, 0)
    }

}


