//
//  GetCurrentWeatherService.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

protocol GetCurrentWeatherService {
    
    func getCurrentWeatherBy(lat: String,
                             lon: String,
                             completion: @escaping((_ currentWeather: CurrentWeatherList?, _ error: ApiError?) -> Void))
    
}

