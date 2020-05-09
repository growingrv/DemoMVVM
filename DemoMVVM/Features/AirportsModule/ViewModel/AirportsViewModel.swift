//
//  AirportsViewModel.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

class AirportsViewModel: NSObject {
    // MARK: - Variables
    weak var dataSource: GenericDataSource<Any>?
    var airportsUtility = AirportsUtility()

    init(dataSource: GenericDataSource<Any>?) {
        self.dataSource = dataSource
    }

    func getNearbyAirportsDetails(of airport: Airport, from airports: [Airport]) {

        var withDistanceAirports: Array = [NearbyAirport]()

        // find out distance from selected location.
        if airport.lat != 0.0 && airport.lon != 0.0 && airport.type == Constants.ResponseValues.typeAirports {
            for thisAirport in airports {

                let details: (distance: Double, code: String) = airportsUtility.distance(lat1: airport.lat,
                                                                                                   lon1: airport.lon,
                                                                                                   lat2: thisAirport.lat,
                                                                                                   lon2: thisAirport.lon,
                                                                                                   airportCode: thisAirport.code)

                let dict = [Constants.ResponseKeys.Airport.code: details.code,
                            Constants.ResponseKeys.Airport.name: thisAirport.name,
                            Constants.ResponseKeys.Airport.city: thisAirport.city,
                            Constants.ResponseKeys.Airport.state: thisAirport.state,
                            Constants.ResponseKeys.Airport.country: thisAirport.country,
                            Constants.ResponseKeys.Airport.distance: details.distance as Double,
                            Constants.ResponseKeys.Airport.runwayLength: thisAirport.runwayLength] as [String: Any]

                let newAirport = NearbyAirport(data: dict)
                withDistanceAirports.append(newAirport)
            }
        }

        let sortedResults = withDistanceAirports.sorted(by: { $0.distance < $1.distance })

        self.dataSource?.data.value = Array(sortedResults.prefix(5))
    }
}
