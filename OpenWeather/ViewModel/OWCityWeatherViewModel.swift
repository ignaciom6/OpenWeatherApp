//
//  OWCityWeatherViewModel.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWCityWeatherViewModel: NSObject {
    class func getMainTempFrom(temp: Double) -> String {
        return String(format:"%.0f", temp )+"º"
    }
    
    class func getFullTimeFrom(unix: Double) -> String {
        let date = Date(timeIntervalSince1970: unix)
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = NSLocale.current
        formatter.dateFormat = "E, d MMM yyyy HH:mm"
        let strDate = formatter.string(from: date)
        
        return strDate
    }
    
    class func getWeatherDescription(array: [OWWeatherDescriptionModel]) -> String {
        return array.first?.main ?? "N/A"
    }
    
    class func getImageURL(array: [OWWeatherDescriptionModel]) -> URL {
        let icon = array.first?.icon ?? "01d"
        let baseUrl = "https://openweathermap.org/img/wn/"+icon+"@2x.png"
        return URL(string: baseUrl)!
    }

}
