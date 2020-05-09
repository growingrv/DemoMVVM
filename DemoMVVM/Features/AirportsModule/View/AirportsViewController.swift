//
//  AirportsViewController.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import UIKit

class AirportsViewController: BaseViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var airportsTableView: UITableView!
    
    // MARK: - Variables
    var selectedAirport: Airport?
    var allAirports: [Airport]?

    let tableViewDataSource = AirportsTableViewDataSource()
    lazy var viewModel: AirportsViewModel = {
        let viewModel = AirportsViewModel(dataSource: tableViewDataSource)
        return viewModel
    }()

    var searchedCity: String = ""
    
    // MARK: - View lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateDelegates()
        updateTableView()
        getNearbyAirportsDetails()
    }

    // MARK: - Private Functions
    private func updateUI() {
        guard let airport = selectedAirport else {
            return
        }
        self.title = airport.city
    }
    private func updateDelegates() {
        self.airportsTableView.dataSource = self.tableViewDataSource
    }
    private func updateTableView() {
        self.tableViewDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.airportsTableView.reloadData()
        }
    }
    func getNearbyAirportsDetails() {
        guard let airport = selectedAirport, let airports = allAirports else {
            print("Error")
            return
        }
        viewModel.getNearbyAirportsDetails(of: airport, from: airports)
    }
}
