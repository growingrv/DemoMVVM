//
//  AirportTableViewCell.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import UIKit

class AirportTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var airportCodeQues: UILabel!
    @IBOutlet weak var airportCodeAns: UILabel!

    @IBOutlet weak var airportNameQues: UILabel!
    @IBOutlet weak var airportNameAns: UILabel!
    
    @IBOutlet weak var airportLocationQues: UILabel!
    @IBOutlet weak var airportLocationAns: UILabel!
    
    @IBOutlet weak var airportRunwayLengthQues: UILabel!
    @IBOutlet weak var airportRunwayLengthAns: UILabel!

    @IBOutlet weak var airportDistanceQues: UILabel!
    @IBOutlet weak var airportDistanceAns: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(airport: NearbyAirport) {
        self.airportCodeAns?.text = airport.code
        self.airportNameAns?.text = airport.name
        
        if airport.runwayLength != 0 {
            self.airportRunwayLengthAns?.text = airport.runwayLength.kmValue.shortValue + " km"
        } else {
            self.airportRunwayLengthAns?.text = "--"
        }
        
        if airport.distance != 0 {
            self.airportDistanceAns?.text = airport.distance.kmValue.shortValue + " km"
        } else {
            self.airportDistanceAns?.text = "--"
        }

        self.airportLocationAns?.text = airport.country
    }
}
