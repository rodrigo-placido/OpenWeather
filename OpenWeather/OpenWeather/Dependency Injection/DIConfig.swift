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
        ServiceLocator.shared.addService(service: WeatherMainViewController() as
                    WeatherMainViewController)
        
    }
}
