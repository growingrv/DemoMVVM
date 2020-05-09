//
//  File.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 17/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US_POSIX")
        return numberFormatter.number(from: self)?.doubleValue
    }
    
    func toInt() -> Int? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US_POSIX")
        return numberFormatter.number(from: self)?.intValue
    }
}
