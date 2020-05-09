//
//  CitiesViewController.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import UIKit

class CitiesViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var citiesSearchBar: UISearchBar!
    @IBOutlet weak var citiesTableView: UITableView!
    
    // MARK: - Variables
    let tableViewDataSource = CitiesTableViewDataSource()
    let service = AirportsService()
    lazy var viewModel: CityListViewModel = {
        let viewModel = CityListViewModel(service: service, dataSource: tableViewDataSource)
        return viewModel
    }()
    let activityIndicator = ActivityIndicator()

    // MARK: - View Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateDelegates()
        updateTableView()
        updateErrorHandler()
        getCityAndAirportsDetails()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        citiesSearchBar.resignFirstResponder()
        self.view.endEditing(true)
    }
    // MARK: - Private Functions
    private func updateUI() {
        self.title = Constants.Titles.cities
    }
    private func updateDelegates() {
        citiesSearchBar.delegate = self
        self.citiesTableView.dataSource = self.tableViewDataSource
    }
    private func updateTableView() {
        self.tableViewDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.activityIndicator.hideActivity()
            self?.citiesTableView.reloadData()
        }
    }
    private func updateErrorHandler() {
        self.viewModel.onErrorHandler = { [weak self] error in
            self?.showAlert(title: Constants.Errors.Titles.generic, message: Constants.Errors.CustomErrorMessages.somethingWrong, style: .alert)
        }
    }
    private func getCityAndAirportsDetails() {
        self.activityIndicator.showActivity(view: view)
        self.viewModel.getCityAndAirportsDetails()
    }
}

// MARK: - UISearchBarDelegate
extension CitiesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.view.endEditing(true)
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.resetCityAndAirportsDetails()
            searchBar.endEditing(true)
        } else {
            guard let airports = viewModel.allAirports, airports.count > 0 else {
                return
            }
            viewModel.searchedCityNameText(searchText)
        }
    }
}

// MARK: - UITableViewDelegate
extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.setSelectedAirport(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: Constants.Segue.airportsViewController, sender: self)
    }
}

// MARK: - Navigation
extension CitiesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.Segue.airportsViewController) {
            let viewController = segue.destination as! AirportsViewController
            viewController.allAirports = viewModel.getAllAirports()
            viewController.selectedAirport = viewModel.getSelectedAirport()
        }
    }
}
