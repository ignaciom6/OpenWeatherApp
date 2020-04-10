//
//  OWTempModel.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWTempModel: NSObject {
    
    var day: Double
    var min: Double
    var max: Double
    var night: Double
    var eve: Double
    var morn: Double
    
    init(withDictionary dictionary: [String : Any]) {
        day = dictionary[OWConstants.kDayKey] as! Double
        min = dictionary[OWConstants.kMinKey] as! Double
        max = dictionary[OWConstants.kMaxKey] as! Double
        night = dictionary[OWConstants.kNightKey] as! Double
        eve = dictionary[OWConstants.kEveKey] as! Double
        morn = dictionary[OWConstants.kMornKey] as! Double
    }

}
