//
//  BTCityWeatherModelManager.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWCityWeatherModelManager: OWModelManager {
    func createModelWithDictionary(dict: [String : Any]) -> OWBaseModel
    {
        let weather = OWWeatherModel(withDictionary: dict)

        return weather
    }

}
