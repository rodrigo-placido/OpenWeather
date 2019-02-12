//
//  CurrentWeather.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

struct CurrentWeather: Unboxable {
    var name: String
    var coord: Coord
    var weather: [Weather]
    
    init () {
        self.name = ""
        self.coord = Coord()
        self.weather = [Weather]()
    }
    
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.coord = try unboxer.unbox(key: "coord")
        self.weather = try unboxer.unbox(key: "weather")
    }
}
