//
//  Coord.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

struct Coord: Unboxable {
    var lat: String
    var lon: String
    
    init() {
        self.lat = ""
        self.lon = ""
    }
    
    init(unboxer: Unboxer) throws {
        self.lat = try unboxer.unbox(key: "lat")
        self.lon = try unboxer.unbox(key: "lon")
    }
    
}
