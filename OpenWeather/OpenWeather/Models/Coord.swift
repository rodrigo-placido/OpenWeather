//
//  Coord.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

class Coord: Unboxable {
    var lat: Double
    var lon: Double
    var distance: Double?
    
    init() {
        self.lat = 0
        self.lon = 0
        self.distance = 0
    }
    
    required init(unboxer: Unboxer) throws {
        self.lat = try unboxer.unbox(key: "Lat")
        self.lon = try unboxer.unbox(key: "Lon")
    }
}
