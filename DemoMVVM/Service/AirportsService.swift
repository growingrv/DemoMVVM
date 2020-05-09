//
//  WebService.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import UIKit

protocol AirportsServiceProtocol: class {
    func fetchAirports(_ completion: @escaping ((Result<[Airport], ErrorResult>) -> Void))
}

class AirportsService: RequestHandler, AirportsServiceProtocol {
    var task: URLSessionTask?
    func fetchAirports(_ completion: @escaping ((Result<[Airport], ErrorResult>) -> Void)) {
        // cancel previous request if already in progress
        self.cancelFetchAirports()
        task = RequestService().loadData(urlPath: urlPath(), completion: self.networkResult(completion: completion))
    }
    func cancelFetchAirports() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
    // URL path changes based on different types of requests being made
    func urlPath() -> String {
        return Constants.ServiceAPI.airportsPath
    }
}
