//
//  CitiesModel.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

/*
 Ideally, there should be one API similar to http://www.geonames.org/export/web-services.html for searching and providing the list of city's. And then another API should take this city's code as parameter and should return airports belonging to that city.
 In that case, this file could have been used to make model for City (e.g.  struct City {})
 Still, for consistency, this file contains model Airport which is kind of super model for us which provides all the data including city name and later to construct NeabyAirport.
 */

struct Airport {
    var code: String
    var lat: Double
    var lon: Double
    var name: String
    var city: String
    var state: String
    var country: String
    var woeid: String
    var tz: String
    var phone: String
    var type: String
    var email: String
    var url: String
    var runwayLength: Double
    var elev: Double
    var icao: String
    var directFlights: Double
    var carriers: Double
    
    init(data: [String: Any]) {
        if let codeResp = data[Constants.ResponseKeys.Airport.code] as? String {
            self.code = codeResp
        } else {
            self.code = ""
        }
        
        if let latStr = data[Constants.ResponseKeys.Airport.lat] as? String {
            self.lat = Double.init(latStr)!
        } else {
            self.lat = 0.0
        }
        
        if let lonStr = data[Constants.ResponseKeys.Airport.lon] as? String {
            self.lon = Double.init(lonStr)!
        } else {
            self.lon = 0.0
        }
        
        if let nameResp = data[Constants.ResponseKeys.Airport.name] as? String {
            self.name = nameResp
        } else {
            self.name = ""
        }

        if let cityResp = data[Constants.ResponseKeys.Airport.city] as? String {
            self.city = cityResp
        } else {
            self.city = ""
        }
        
        if let stateResp = data[Constants.ResponseKeys.Airport.state] as? String {
            self.state = stateResp
        } else {
            self.state = ""
        }

        if let countryResp = data[Constants.ResponseKeys.Airport.country] as? String {
            self.country = countryResp
        } else {
            self.country = ""
        }

        if let woeidResp = data[Constants.ResponseKeys.Airport.woeid] as? String {
            self.woeid = woeidResp
        } else {
            self.woeid = ""
        }

        if let tzResp = data[Constants.ResponseKeys.Airport.tz] as? String {
            self.tz = tzResp
        } else {
            self.tz = ""
        }

        if let phoneResp = data[Constants.ResponseKeys.Airport.phone] as? String {
            self.phone = phoneResp
        } else {
            self.phone = ""
        }
        
        if let typeResp = data[Constants.ResponseKeys.Airport.type] as? String {
            self.type = typeResp
        } else {
            self.type = ""
        }
        
        if let emailResp = data[Constants.ResponseKeys.Airport.email] as? String {
            self.email = emailResp
        } else {
            self.email = ""
        }
        
        if let urlResp = data[Constants.ResponseKeys.Airport.url] as? String {
            self.url = urlResp
        } else {
            self.url = ""
        }

        if let runwayLengthStr = data[Constants.ResponseKeys.Airport.runwayLength] as? String {
            self.runwayLength = Double.init(runwayLengthStr)!
        } else {
            self.runwayLength = 0.0
        }

        if let elevStr = data[Constants.ResponseKeys.Airport.elev] as? String {
            self.elev = Double.init(elevStr)!
        } else {
            self.elev = 0.0
        }

        if let icaoResp = data[Constants.ResponseKeys.Airport.icao] as? String {
            self.icao = icaoResp
        } else {
              self.icao = ""
        }

        if let directFlightsStr = data[Constants.ResponseKeys.Airport.directFlights] as? String {
            self.directFlights = Double.init(directFlightsStr)!
        } else {
            self.directFlights = 0.0
        }

        if let carriersStr = data[Constants.ResponseKeys.Airport.carriers] as? String {
            self.carriers = Double.init(carriersStr)!
        } else {
            self.carriers = 0.0
        }
    }
}

extension Airport: Parseable {
    static func parseObject(dictionary: [String: AnyObject]) -> Result<Airport, ErrorResult> {
        // Make model here
        if let value = dictionary as? [String: AnyObject] {
            let airport = Airport(data: value)
            return Result.success(airport)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse"))
        }
    }
}
