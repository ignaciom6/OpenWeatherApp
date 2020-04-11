//
//  OWImageDownloader.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
