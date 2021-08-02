//
//  FetchUsersAPIService.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import Foundation

enum FetchUsersAPIService {
    case queryUsers
    case queryMoreUsers(page: Int)
}

extension FetchUsersAPIService: APIServiceProtocol {
    
    var headers: Headers? {
        return nil
    }
    
    var path: String {
        return "/users"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var requestType: RequestType  {
        
        
        switch self {
        case .queryUsers:
            return .plain
        case let .queryMoreUsers(page):
            let parameters = ["page": page]
            return .with(parameters)
        }
        
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
    
}
