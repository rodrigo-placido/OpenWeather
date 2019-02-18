//
//  WeatherHelper.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 17/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

class WeatherHelper {
    static func convertToFahrenheit(celsius: Double) -> Double {
        return (celsius * 1.8) + 32
    }
}
