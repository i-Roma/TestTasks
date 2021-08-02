//
//  NetworkError.swift
//

import Foundation

enum NetworkError: String, Error {
    case unknown             = "Unexpected error"
    case decodingError       = "Swift.DecodingError keyNotFound "
    case authenticationError = "You must be Authenticated. Please login."
    case badRequest          = "Bad Request"
    case serverSideError     = "Server error"
    case noJSONData          = "No JSON data"
}
