//
//  OWConnectionService.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWConnectionService: NSObject {

    fileprivate static let session = URLSession(configuration: URLSessionConfiguration.default)

    func getAPIResponseForCity(city: OWCityModel, withCompletion completion: @escaping (_ value:[String : Any]?, _ error: Error?) -> Void)
    {
        var weatherDic: [String : Any]?
        let url = OWServiceUtils.getURLForCity(city: city)
        
        let task = OWConnectionService.session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                do {
                    weatherDic = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                } catch {
                    completion(weatherDic, error)
                }
                completion(weatherDic, error)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
