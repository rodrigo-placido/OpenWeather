//
//  GetCurrentWeatherServiceStub.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 18/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
class GetCurrentWeatherServiceStub: GetCurrentWeatherService {

    func getCurrentWeatherBy(latMin: Double,
                         latMax: Double,
                         lonMin: Double,
                         lonMax: Double,
                         completion: @escaping ((_ currentWeather: CurrentWeatherList?, _ error: ApiError?) -> Void)) {
        let weather = CurrentWeather(name: "São Paulo", coord: Coord(lat: -23.5489, lon: -46.6388),
                                     main: Main(tempCelsius: "22"),
                                     weather: [Weather(id: 223, main: "Rain", description: "light rain", icon: "10n")])
        
        let weather2 = CurrentWeather(name: "Rio de Janeiro", coord: Coord(lat: -22.9035, lon: -43.2096),
                                     main: Main(tempCelsius: "30"),
                                     weather: [Weather(id: 223, main: "Rain", description: "light rain", icon: "10n")])
        completion(CurrentWeatherList(currentWeatherList: [weather, weather2]), nil)

    }
}
