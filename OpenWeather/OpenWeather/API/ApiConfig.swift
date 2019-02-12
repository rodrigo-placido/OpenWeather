//
//  ApiConfig.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

struct ApiConfig {
    static let apiHost = "http://api.openweathermap.org/data/2.5/"
    static let apiKey = "7d01c7a2d8be734b04a8397cbd8c4356"
    static let statusCodeValid = 200..<300
    
    static func getUrlFindByCoordinates(lat: String, lon: String) -> String {
        return "\(apiHost)find?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"
    }
}
