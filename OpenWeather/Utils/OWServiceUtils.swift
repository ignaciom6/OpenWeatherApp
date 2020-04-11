//
//  OWServiceUtils.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWServiceUtils: NSObject {

    class func getURLForCity(city: OWCityModel) -> URL {
        let urlComponents = NSURLComponents(string: "https://api.openweathermap.org/data/2.5/onecall")
        let appIdKey = "07ee4f5e922183c2c49256d3e5011b4e"
        
        let lat = city.lat
        let lon = city.lon
        urlComponents?.queryItems = [
            URLQueryItem(name: "lat", value: String(lat)),
            URLQueryItem(name: "lon", value: String(lon)),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: appIdKey)]
        
        return (urlComponents?.url)!
    }
    
}
