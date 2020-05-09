//
//  INT+Extension.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 17/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

extension Double {
    var kmValue: Double { return self/1000 }
    var shortValue: String { return String(format: "%.2f", self) }
}
