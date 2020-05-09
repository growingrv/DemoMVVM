//
//  ActivityIndicator.swift
//  DemoMVVM
//
//  Created by Gaurav Tiwari on 17/04/20.
//  Copyright © 2020 Gaurav Tiwari. All rights reserved.
//

import UIKit

class ActivityIndicator {
    let activity = UIActivityIndicatorView(style: .gray)
    
    func showActivity(view:UIView){
        view.addSubview(activity)
        activity.frame = view.bounds
        activity.startAnimating()
    }
    func hideActivity(){
        self.activity.stopAnimating()
        self.activity.removeFromSuperview()
    }
}
