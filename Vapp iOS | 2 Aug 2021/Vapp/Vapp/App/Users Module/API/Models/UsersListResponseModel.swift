//
//  UsersListResponseModel.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

// MARK: UsersListResponseModel

// MARK: - UsersListResponseModel -

struct UsersListResponseModel: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UsersListItem]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

// MARK: - UsersListItem
class UsersListItem: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    var isSelected = false

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
    init(
        id: Int,
        email: String,
        firstName: String,
        lastName: String,
        avatar: String,
        isSelected: Bool
    ) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.isSelected = isSelected
    }
}

extension UsersListItem {
    
    static var dummyData: UsersListItem {
        .init(
            id: 0,
            email: "",
            firstName: "",
            lastName: "",
            avatar: "",
            isSelected: false
        )
    }
    
}
