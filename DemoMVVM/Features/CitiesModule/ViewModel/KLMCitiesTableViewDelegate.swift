//
//  KLMCitiesTableViewDelegate.swift
//  KLMTask
//
//  Created by Gaurav Tiwari on 07/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import Foundation
import UIKit

class KLMCitiesTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.findTopFiveNearByAirports(selectedIndexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "KLMAirportsViewController", sender: self)
    }
}
