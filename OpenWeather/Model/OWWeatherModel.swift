//
//  OWWeatherModel.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWWeatherModel: OWBaseModel {
    
    var currentWeather: OWCurrentWeatherModel
    var dailyWeather: [OWDailyWeatherModel]
    
    required init(withDictionary dictionary: [String : Any]) {
        currentWeather = OWCurrentWeatherModel(withDictionary: dictionary[OWConstants.kCurrentKey] as! [String : Any])
        
        let array = dictionary[OWConstants.kDailyKey] as! [AnyHashable]
        var dailyArray: [OWDailyWeatherModel] = []
        for daily in array {
            let dailyWeather = OWDailyWeatherModel(withDictionary: daily as! [String : Any])
            dailyArray.append(dailyWeather)
        }
        
        dailyWeather = dailyArray
    }
}
