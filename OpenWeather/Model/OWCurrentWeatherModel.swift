//
//  OWWeatherModel.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWCurrentWeatherModel: NSObject {
    
    var temp: Double
    var feelsLike: Double
    var time: Double
    var wind: Double
    var humidity: Double
    var rain: OWRainModel?
    var weatherDescription: [OWWeatherDescriptionModel]

    init(withDictionary dictionary: [String : Any]) {
        let rainDefautlModel: [String : Any] = [OWConstants.k1hKey : OWConstants.kDefaultDoubleValue]
        
        temp = dictionary[OWConstants.kTempKey] as! Double
        feelsLike = dictionary[OWConstants.kFeelsLikeKey] as! Double
        time = dictionary[OWConstants.kTimeKey] as! Double
        wind = dictionary[OWConstants.kWindSpeedKey] as! Double
        humidity = dictionary[OWConstants.kHumidityKey] as! Double
        rain = OWRainModel(withDictionary: dictionary[OWConstants.kRainKey] as? [String : Any] ?? rainDefautlModel)
        
        let array = dictionary[OWConstants.kWeatherKey] as! [AnyHashable]
        var weatherArray: [OWWeatherDescriptionModel] = []
        for weather in array {
            let weatherDesc = OWWeatherDescriptionModel(withDictionary: weather as! [String : Any])
            weatherArray.append(weatherDesc)
        }
        
        weatherDescription = weatherArray
    }

}
