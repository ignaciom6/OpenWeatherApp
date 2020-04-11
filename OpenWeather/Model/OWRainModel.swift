//
//  OWRainModel.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWRainModel: NSObject {
    var rain: Double

    init(withDictionary dictionary: [String : Any]) {
        rain = dictionary[OWConstants.k1hKey] as! Double
    }
}
