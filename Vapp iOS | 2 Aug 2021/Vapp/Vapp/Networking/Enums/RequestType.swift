//
//  RequestType.swift
//

import Foundation

typealias Parameters = [String: Any]

enum RequestType {
    case plain
    case with(Parameters)
}
