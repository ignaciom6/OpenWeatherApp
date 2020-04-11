//
//  OWBaseModel.swift
//  OpenWeather
//
//  Created by Ignacio on 11/04/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import Foundation

protocol OWBaseModel {
    init(withDictionary dictionary: [String : Any])
}
