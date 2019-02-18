//
//  Main.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 17/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

class Main: Unboxable {
    let tempCelsius: String
    let tempFahrenheit: String?
    
    required init(unboxer: Unboxer) throws {
        let temp: Double = try unboxer.unbox(key: "temp")
        self.tempCelsius = "\(Int(temp))°C"
        let fahrenheit = WeatherHelper.convertToFahrenheit(celsius: temp)
        self.tempFahrenheit = "\(Int(fahrenheit))°F"

    }
    
    init() {
        self.tempCelsius = ""
        self.tempFahrenheit = ""
    }
}