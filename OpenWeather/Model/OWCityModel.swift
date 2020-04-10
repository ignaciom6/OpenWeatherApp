//
//  OWCityModel.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWCityModel: NSObject {
    
    var name: String
    var lat: Double
    var lon: Double
    var weather: OWWeatherModel?
    
    init(withName cityName: String, latitude: Double, longitude: Double) {
        name = cityName
        lat = latitude
        lon = longitude
    }

}
