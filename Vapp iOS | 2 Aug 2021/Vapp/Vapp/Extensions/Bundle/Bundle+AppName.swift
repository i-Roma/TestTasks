//
//  Bundle+AppName.swift
//

import Foundation

let appName = Bundle.main.appName

extension Bundle {
    
    var appName: String {
        guard let bundle = Bundle.main.infoDictionary else { return String() }
        guard let appName = bundle[kCFBundleNameKey as String] as? String else { return String() }
        return appName
    }
    
}
