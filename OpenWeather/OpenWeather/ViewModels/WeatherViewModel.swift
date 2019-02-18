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
    case loading()
    case success(_ currentWeatherList: CurrentWeatherList)
    case error(_ apiError: ApiError)
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
        
        completion(.loading())
        getCurrentWeatherService.getCurrentWeatherBy(latMin: latMin, latMax: latMax, lonMin: lonMin, lonMax: lonMax) { (currentWeather, error) in
            if (error == nil) {
                currentWeather?.currentWeatherList.forEach(){
                    $0.coord.distance = self.distanceFromLocation(location1: CLLocation(latitude: lat, longitude: lon), location2: CLLocation(latitude: $0.coord.lat, longitude: $0.coord.lon))
                }
                currentWeather?.currentWeatherList = ((currentWeather?.currentWeatherList.filter({$0.coord.distance!
                    < 50000.0}).sorted(by: {(a: CurrentWeather, b: CurrentWeather) -> Bool in
                        return a.coord.distance! < b.coord.distance!
                    }))!)
                completion(.success(currentWeather!))
            } else {
                completion(.error(error!))
            }
        }
    }
    
    private func distanceFromLocation(location1: CLLocation, location2: CLLocation) -> Double {
        return location1.distance(from: location2)
    }
}



