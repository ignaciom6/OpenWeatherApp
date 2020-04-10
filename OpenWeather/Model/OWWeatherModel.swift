//
//  OWWeatherModel.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWWeatherModel: NSObject {
    
    var currentWeather: OWCurrentWeatherModel
    var dailyWeather: [OWDailyWeatherModel]
    
    init(withDictionary dictionary: [String : Any]) {
        currentWeather = dictionary[OWConstants.kCurrentKey] as! OWCurrentWeatherModel
        
        let array = dictionary[OWConstants.kDailyKey] as! [AnyHashable]
        var dailyArray: [OWDailyWeatherModel] = []
        for daily in array {
            let dailyWeather = OWDailyWeatherModel(withDictionary: daily as! [String : Any])
            dailyArray.append(dailyWeather)
        }
        
        dailyWeather = dailyArray
    }
}
