//
//  Colors.swift
//  Vapp
//
//  Created by Roman Romanenko on 23.07.2021.
//  Copyright © 2019 Roman Romanenko. All rights reserved.
//

import UIKit

public struct Palette {
    
    struct primary {
        static let gray = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        static let backgroundColor = UIColor.white
        
        struct text {
            static let title = UIColor(red: 77/255, green: 77/255, blue: 77/255, alpha: 1)
            static let subtitle = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        }
        
    }
    
    struct secondary {
        static let gray = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    }
    
}
