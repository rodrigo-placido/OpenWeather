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
    let selectedTemp: String?
    
    required init(unboxer: Unboxer) throws {
        let temp: Double = try unboxer.unbox(key: "temp")
        self.tempCelsius = "\(Int(temp))°C"
        let fahrenheit = WeatherHelper.convertToFahrenheit(celsius: temp)
        self.tempFahrenheit = "\(Int(fahrenheit))°F"
        self.selectedTemp = UserPreference.getShowFahrenheitTemp() ? self.tempFahrenheit : self.tempCelsius
    }
    
    init() {
        self.tempCelsius = ""
        self.tempFahrenheit = ""
        self.selectedTemp = ""
    }
    
    init(tempCelsius: String) {
        self.tempCelsius = "\(tempCelsius)°C"
        let fahrenheit = WeatherHelper.convertToFahrenheit(celsius: Double(tempCelsius)!)
        self.tempFahrenheit = "\(fahrenheit)°F"
        self.selectedTemp = UserPreference.getShowFahrenheitTemp() ? self.tempFahrenheit : self.tempCelsius
    }
}
