//
//  Constants.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 17/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

struct Constants {
    struct Titles {
        static let cities = "Cities"
    }
    struct IDs {
        static let cityTableViewCell = "CityTableViewCell"
        static let airportTableViewCell = "AirportTableViewCell"
    }
    struct Segue {
        static let citiesViewController = "CitiesViewController"
        static let airportsViewController = "AirportsViewController"
    }
    struct Errors {
        struct Titles {
            static let generic = "Error occured"
        }
        struct CustomErrorMessages {
            static let somethingWrong = "Oops, something went wrong!"
            static let missingService = "Missing service"
        }
        struct NetworkErrorMessages {
            
        }
        struct ParserErrorMessages {
            static let parseError = "Unable to parse"
        }
    }
    
    struct ServiceAPI {
        static let base = "https://gist.githubusercontent.com/"
        static let airportsPath = "tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json"
    }

    struct ResponseKeys {
        struct Airport {
            static let code = "code"
            static let lat = "lat"
            static let lon = "lon"
            static let name = "name"
            static let city = "city"
            static let state = "state"
            static let country = "country"
            static let woeid = "woeid"
            static let tz = "tz"
            static let phone = "phone"
            static let type = "type"
            static let email = "email"
            static let url = "url"
            static let runwayLength = "runway_length"
            static let elev = "elev"
            static let icao = "icao"
            static let directFlights = "direct_flights"
            static let carriers = "carriers"

            static let distance = "distance"
        }
    }
    struct ResponseValues {
        static let typeAirports = "Airports"
    }
}
