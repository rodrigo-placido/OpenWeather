//
//  CurrentWeatherList.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 12/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

class CurrentWeatherList: Unboxable {
    var currentWeatherList: [CurrentWeather]
    
    required init(unboxer: Unboxer) throws {
        self.currentWeatherList = try unboxer.unbox(key: "list")
    }
    
    init() {
        self.currentWeatherList = [CurrentWeather]()
    }
}
