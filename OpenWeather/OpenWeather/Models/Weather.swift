//
//  Weather.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

class Weather: Unboxable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    var iconUrl: String
    
    init() {
        self.id = 0
        self.main = ""
        self.description = ""
        self.icon = ""
        self.iconUrl = ""
    }
    
    required init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.main = try unboxer.unbox(key: "main")
        self.description = try unboxer.unbox(key: "description")
        self.icon = try unboxer.unbox(key: "icon")
        self.iconUrl = "http://openweathermap.org/img/w/\(self.icon).png"
    }
    
    init(id: Int, main: String, description: String, icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
        self.iconUrl = "http://openweathermap.org/img/w/\(self.icon).png"
    }
}
