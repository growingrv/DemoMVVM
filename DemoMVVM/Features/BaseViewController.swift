//
//  BaseViewController.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 16/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - View Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func showAlert(title: String, message: String, style: UIAlertController.Style) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        self.present(controller, animated: true, completion: nil)
    }
}
