//
//  OWSpinner.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

var aView: UIView?

extension UIViewController {
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        
        var activityIndicator: UIActivityIndicatorView!
        
        switch traitCollection.userInterfaceStyle {
        case .light:
            activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        case .dark:
            activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        case .unspecified: break
        @unknown default:
            break
        }

        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        aView?.addSubview(activityIndicator)
        self.view.addSubview(aView!)
    }
    
    func hideSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}
