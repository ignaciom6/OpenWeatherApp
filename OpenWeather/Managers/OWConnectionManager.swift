//
//  OWConnectionManager.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWConnectionManager: NSObject {

    func getDataForCity(city: OWCityModel, modelManager: OWModelManager, withCompletion completion: @escaping (_ value: OWBaseModel?, _ error: Error?) -> Void) {
        let connectionSrv = OWConnectionService()
        
        connectionSrv.getAPIResponseForCity(city: city) { (value, error) in
            if value != nil {
                completion(modelManager.createModelWithDictionary(dict: value ?? [:]), nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
