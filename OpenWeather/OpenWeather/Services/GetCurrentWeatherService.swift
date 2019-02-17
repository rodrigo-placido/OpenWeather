//
//  GetCurrentWeatherService.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

protocol GetCurrentWeatherService {
    
    func getCurrentWeatherBy(latMin: Double,
                             latMax: Double,
                             lonMin: Double,
                             lonMax: Double,
                             completion: @escaping((_ currentWeather: CurrentWeatherList?, _ error: ApiError?) -> Void))
    
}

