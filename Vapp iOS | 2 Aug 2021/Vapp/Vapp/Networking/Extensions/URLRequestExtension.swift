//
//  URLRequestExtension.swift
//

import Foundation

extension URLRequest {
    
    init(apiService: APIServiceProtocol) {
        let urlComponents = URLComponents(apiService: apiService)
        
        self.init(url: urlComponents.url!)
        
        httpMethod = apiService.method.rawValue
        apiService.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        guard case let .with(parameters) = apiService.requestType, apiService.parametersEncoding == .json else { return }
        
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
    
}
