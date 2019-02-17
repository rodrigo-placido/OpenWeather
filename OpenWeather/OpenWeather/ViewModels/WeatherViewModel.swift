//
//  WeatherViewModel.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 12/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

enum WeatherViewModelCallback {
    case success(_ currentWeatherList: CurrentWeatherList)
}

class WeatherViewModel {
    private var getCurrentWeatherService: GetCurrentWeatherService
    
    init(getCurrentWeatherService: GetCurrentWeatherService) {
        self.getCurrentWeatherService = getCurrentWeatherService
    }
    
    func getCurrentWeatherBy(lat: Double,
                             lon: Double,
                             completion: @escaping((_ completion: WeatherViewModelCallback) -> Void)){
        
        let center = CLLocationCoordinate2DMake(lat, lon)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 50000, longitudinalMeters: 50000)
        let latMin = region.center.latitude - 0.5 * region.span.latitudeDelta;
        let latMax = region.center.latitude + 0.5 * region.span.latitudeDelta;
        let lonMin = region.center.longitude - 0.5 * region.span.longitudeDelta;
        let lonMax = region.center.longitude + 0.5 * region.span.longitudeDelta;

        getCurrentWeatherService.getCurrentWeatherBy(latMin: latMin, latMax: latMax, lonMin: lonMin, lonMax: lonMax) { (currentWeather, error) in
            completion(.success(currentWeather!))
        }
    }
}



