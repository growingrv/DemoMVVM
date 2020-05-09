//
//  CityListViewModel.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation

class CityListViewModel {
    // MARK: - Variables
    weak var dataSource: GenericDataSource<Any>?
    weak var service: AirportsServiceProtocol?
    var allAirports: [Airport]?
    var searchedAirports: [Airport]? = []
    var currentAirport: Airport?

    var onErrorHandler: ((ErrorResult?) -> Void)?

    init(service: AirportsServiceProtocol = FileDataService(), dataSource: GenericDataSource<Any>?) {
        self.dataSource = dataSource
        self.service = service
    }
}

extension CityListViewModel {
    // MARK: - Public Functions
    func getCityAndAirportsDetails() {
        guard let service = service else {
            onErrorHandler?(ErrorResult.custom(string: Constants.Errors.CustomErrorMessages.missingService))
            return
        }
        service.fetchAirports({ result in
            DispatchQueue.main.async {
                switch result {
                case .success(let airport):
                    self.dataSource?.data.value = airport
                    self.allAirports = self.dataSource?.data.value as? [Airport]
                case .failure(let error):
                    self.onErrorHandler?(error)
                }
            }
        })
    }
    func searchedCityNameText(_ searchText: String) {
        guard let airportList = allAirports, airportList.count > 0  else {
            return
        }
        
        searchedAirports = airportList.filter { ($0.city.localizedCaseInsensitiveContains(searchText)) }
        
        if let searchedAirports = self.searchedAirports {
            self.dataSource?.data.value = searchedAirports
        }
    }
    
    func resetCityAndAirportsDetails() {
        guard let airportList = allAirports, airportList.count > 0  else {
            return
        }
        self.searchedAirports?.removeAll()
        self.dataSource?.data.value = airportList
    }
}

extension CityListViewModel {
    // MARK: - Public setters and getters
    func setSelectedAirport(_ selectedIndexPath: IndexPath) {
        guard let searchedAirports = self.searchedAirports else {
            return
        }
        guard let airports = self.allAirports else {
            return
        }
        if (searchedAirports.count > 0) {
            self.currentAirport = searchedAirports[selectedIndexPath.row]
        } else {
            self.currentAirport = airports[selectedIndexPath.row]
        }
    }
    func getSelectedAirport() -> Airport? {
        guard let airport = self.currentAirport else {
            return nil
        }
        return airport
    }
    func getAllAirports() -> [Airport]? {
        guard let airports = self.allAirports else {
            return nil
        }
        return airports
    }
}
