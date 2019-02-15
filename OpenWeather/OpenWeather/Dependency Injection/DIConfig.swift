//
//  DIConfig.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 12/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

class DIConfig {
    func setup() {
        ServiceLocator.shared.addService(service: WeatherTableViewController(weatherViewModel: WeatherViewModel(getCurrentWeatherService: GetCurrentWeatherServiceImp())) as
            WeatherTableViewController)
        
        ServiceLocator.shared.addService(service: WeatherMapViewController(weatherViewModel: WeatherViewModel(getCurrentWeatherService: GetCurrentWeatherServiceImp())) as
            WeatherMapViewController)
        
        guard let weatherTableViewController: WeatherTableViewController = ServiceLocator.shared.getService() else {return}
        guard let weatherMapViewController: WeatherMapViewController = ServiceLocator.shared.getService() else {return}
        
        ServiceLocator.shared.addService(service: WeatherMainViewController(listView: weatherTableViewController, mapView: weatherMapViewController) as
                    WeatherMainViewController)
        
    }
}
