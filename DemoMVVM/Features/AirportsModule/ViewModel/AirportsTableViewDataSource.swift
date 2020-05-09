//
//  AirportsTableViewDataSource.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation
import UIKit

class AirportsTableViewDataSource: GenericDataSource<Any>, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: AirportTableViewCell = tableView.dequeueReusableCell(withIdentifier:  Constants.IDs.airportTableViewCell, for: indexPath) as! AirportTableViewCell

        let airport = self.data.value[indexPath.row]

        cell.configureCell(airport: airport as! NearbyAirport)
        return cell
    }
}
