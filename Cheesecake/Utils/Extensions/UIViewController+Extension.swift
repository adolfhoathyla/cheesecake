//
//  UIViewController+Extension.swift
//  Cheesecake
//
//  Created by Athyla Beserra on 24/03/19.
//  Copyright © 2019 Athyla Beserra. All rights reserved.
//

import UIKit

extension UIViewController {

    func startAnimating() {
        self.view.activityIndicatorView.startAnimating()
        print("startAnimating")
    }
    
    func stopAnimating() {
        self.view.activityIndicatorView.stopAnimating()
        print("stopAnimating")
    }
}
