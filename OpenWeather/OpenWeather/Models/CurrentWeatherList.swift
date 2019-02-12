//
//  CurrentWeatherList.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 12/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

struct CurrentWeatherList: Unboxable {
    var currentWeatherList: [CurrentWeather]
    
    init(unboxer: Unboxer) throws {
        self.currentWeatherList = try unboxer.unbox(key: "list")
    }
    
    init() {
        self.currentWeatherList = [CurrentWeather]()
    }
}
