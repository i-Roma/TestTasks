//
//  ProviderProtocol.swift
//

import Foundation

typealias Server<Response> = (Result<Response, NetworkError>) -> ()

protocol ProviderProtocol {
    func request<Response>(from apiService: APIServiceProtocol,
                           responseType: Response.Type,
                           completion: @escaping Server<Response>)  -> URLSessionDataTask where Response: Decodable
}
