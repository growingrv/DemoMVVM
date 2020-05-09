//
//  AirportsUtility.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

struct AirportsUtility {    
    // This function converts decimal degrees to radians
    func deg2rad(deg:Double) -> Double {
        return deg * Double.pi / 180
    }

    // This function converts radians to decimal degrees
    func rad2deg(rad:Double) -> Double {
        return rad * 180.0 / Double.pi
    }
    
    func distance(lat1:Double, lon1: Double, lat2: Double, lon2: Double, airportCode: String) -> (distance: Double, code: String) {
        let theta = lon1 - lon2
        var dist = sin(deg2rad(deg: lat1)) * sin(deg2rad(deg: lat2)) + cos(deg2rad(deg: lat1)) * cos(deg2rad(deg: lat2)) * cos(deg2rad(deg: theta))
        dist = acos(dist)
        dist = rad2deg(rad: dist)
        dist = dist * 60 * 1.1515
        return (dist, airportCode)
    }
}
