//
//  Dictionary+Extensions.swift
//  Vapp
//
//  Created by Roman Home on 23.07.2021.
//  Copyright © 2021 Roman Romanenko. All rights reserved.
//

import Foundation

extension Dictionary {
    
    var count: Int {
        return Array(self.values).count
    }
    
    var valuesArray: [Dictionary<Key, Value>.Values.Element] {
        return Array(self.values)
    }
    
    var keysArray: [Dictionary<Key, Value>.Keys.Element] {
        return Array(self.keys)
    }
}
