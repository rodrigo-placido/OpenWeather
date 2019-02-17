//
//  CurrentWeather.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

class CurrentWeather: Unboxable {
    var name: String
    var coord: Coord
    var main: Main
    var weather: [Weather]
    
    init () {
        self.name = ""
        self.coord = Coord()
        self.main = Main()
        self.weather = [Weather]()
    }
    
    required init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.coord = try unboxer.unbox(key: "coord")
        self.main = try unboxer.unbox(key: "main")
        self.weather = try unboxer.unbox(key: "weather")
    }
}
