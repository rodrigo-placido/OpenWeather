//
//  CurrentWeather.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

struct CurrentWeather {
    var name: String
    var coord: Coord
    var weather: [Weather]
    
    init () {
        self.name = ""
        self.coord = Coord()
        self.weather = [Weather]()
    }
}
