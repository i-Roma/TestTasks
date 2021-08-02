//
//  UsersListAPIWorkerTests.swift
//  VappTests
//
//  Created by Roman Home on 27.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import XCTest
@testable import Vapp

class UsersListAPIWorkerTests: XCTestCase {
    
    private var usersListAPIWorker: UsersListAPIWorker!

    override func setUpWithError() throws {
        usersListAPIWorker = UsersListAPIWorker(delegate: nil)
    }

    override func tearDownWithError() throws {
        usersListAPIWorker = nil
    }

    func test_unsuccessfull_load_data() throws {
        let mock = UsersListAPIWorkerFailMock()
        XCTAssertEqual(mock.lastCursor, mock.nextCursor)
    }
    
    func test_successfull_load_data() throws {
        let mock = UsersListAPIWorkerSuccessMock()
        XCTAssertLessThan(mock.nextCursor!, mock.totalPages!)
    }
    
    func test_unsuccessfull_load_more_data() throws {
        let mock = UsersListAPIWorkerFailMock()
        XCTAssertEqual(mock.lastCursor, mock.nextCursor)
        XCTAssertLessThanOrEqual(mock.fetchedDataCount - 1, 0)
        
        // Given
        XCTAssertEqual(mock.isLoading, true)
        
        // When
        mock.isLoading = false
        
        // AND
        mock.loadMoreData()
        
        // AND
        mock.isLoading = true
        
        // Then
        XCTAssertEqual(mock.isLoading, true)
    }
    
    func test_successfull_load_more_data() throws {
        let mock = UsersListAPIWorkerSuccessMock()
        XCTAssertLessThan(mock.nextCursor!, mock.totalPages!)
        XCTAssertGreaterThan(mock.fetchedDataCount - 1, 0)
        
        // Given
        XCTAssertEqual(mock.isLoading, false)
        
        // When
        mock.isLoading = true
        
        // AND
        mock.loadMoreData()
        
        // AND
        mock.isLoading = false
        
        // Then
        XCTAssertEqual(mock.isLoading, false)
    }

}

