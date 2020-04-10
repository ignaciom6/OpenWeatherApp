//
//  OWWeatherDescriptionModel.swift
//  OpenWeather
//
//  Created by Ignacio on 10/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class OWWeatherDescriptionModel: NSObject {
    
    var main: String
    var desc: String
    var icon: String
    
    init(withDictionary dictionary: [String : Any]) {
        main = dictionary[OWConstants.kMainKey] as! String
        desc = dictionary[OWConstants.kDescriptionKey] as! String
        icon = dictionary[OWConstants.kIconKey] as! String
    }

}
