//
//  WeatherViewModel.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 12/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

class WeatherViewModel {
    private var getCurrentWeatherService: GetCurrentWeatherService
    
    init(getCurrentWeatherService: GetCurrentWeatherService) {
        self.getCurrentWeatherService = getCurrentWeatherService
    }
}



