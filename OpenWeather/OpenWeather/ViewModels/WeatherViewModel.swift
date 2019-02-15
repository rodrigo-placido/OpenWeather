//
//  WeatherViewModel.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 12/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

enum WeatherViewModelCallback {
    case success(_ currentWeatherList: CurrentWeatherList)
}

class WeatherViewModel {
    private var getCurrentWeatherService: GetCurrentWeatherService
    
    init(getCurrentWeatherService: GetCurrentWeatherService) {
        self.getCurrentWeatherService = getCurrentWeatherService
    }
    
    func getCurrentWeatherBy(lat: String,
                             lon: String,
                             completion: @escaping((_ completion: WeatherViewModelCallback) -> Void)){
        getCurrentWeatherService.getCurrentWeatherBy(lat: "", lon: "") { (currentWeather, error) in
            completion(.success(currentWeather!))
        }
        
    }
}



