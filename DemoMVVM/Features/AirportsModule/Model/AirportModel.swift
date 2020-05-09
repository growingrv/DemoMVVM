//
//  AirportsModel.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

/*
 struct Airport {} is the main model which provides all City and Airport specific data.
 Still, following model is used by AirportsViewModel.
 This simplifying the model and keeps only what is necessary for displaying 5 nearby airports.
 This also enumeration fast when enumerating over all airports list
*/

struct NearbyAirport {
    var code: String
    var name: String
    var city: String
    var state: String
    var country: String

    var runwayLength: Double = 0
    var distance: Double = 0

    init(data: [String: Any]) {
        if let code = data[Constants.ResponseKeys.Airport.code] as? String {
            self.code = code
        } else {
            self.code = ""
        }

        if let name = data[Constants.ResponseKeys.Airport.name] as? String {
            self.name = name
        } else {
            self.name = ""
        }

        if let city = data[Constants.ResponseKeys.Airport.city] as? String {
            self.city = city
        } else {
            self.city = ""
        }

        if let state = data[Constants.ResponseKeys.Airport.state] as? String {
            self.state = state
        } else {
            self.state = ""
        }

        if let country = data[Constants.ResponseKeys.Airport.country] as? String {
            self.country = country
        } else {
            self.country = ""
        }

        if let runwayLength = data[Constants.ResponseKeys.Airport.runwayLength] {
            self.runwayLength = runwayLength as! Double
        } else {
            self.runwayLength = 0.0
        }

        if let distanceStr = data[Constants.ResponseKeys.Airport.distance] {
            distance = distanceStr as! Double
        } else {
            distance = 0.0
        }
    }
}
