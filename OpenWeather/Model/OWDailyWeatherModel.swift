//
//  OWDailyWeatherModel.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWDailyWeatherModel: NSObject {
    
    var day: Double
    var tempModel: OWTempModel
    var weatherDescription: [OWWeatherDescriptionModel]
    
    init(withDictionary dictionary: [String : Any]) {
        day = dictionary[OWConstants.kTimeKey] as! Double
        tempModel = OWTempModel(withDictionary: dictionary["temp"] as! [String : Any])
        
        let array = dictionary[OWConstants.kWeatherKey] as! [AnyHashable]
        var weatherArray: [OWWeatherDescriptionModel] = []
        for weather in array {
            let weatherDesc = OWWeatherDescriptionModel(withDictionary: weather as! [String : Any])
            weatherArray.append(weatherDesc)
        }

        weatherDescription = weatherArray
    }

}
