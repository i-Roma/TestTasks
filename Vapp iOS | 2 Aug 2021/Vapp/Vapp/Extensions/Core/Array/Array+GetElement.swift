//
//  Array+GetElement.swift
//

import Foundation

extension Array {
    
    func getElement(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
    
}
