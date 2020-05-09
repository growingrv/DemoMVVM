//
//  CityTableViewCell.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityLocation: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(airport: Airport) {
        self.cityName?.text = airport.city
        guard airport.state.count != 0 else {
            self.cityLocation.text = airport.country
            guard airport.country.count != 0 else {
                self.cityLocation?.text = ""
                return
            }
            return
        }
        self.cityLocation?.text = "\(airport.state), \(airport.country)"
    }
}
