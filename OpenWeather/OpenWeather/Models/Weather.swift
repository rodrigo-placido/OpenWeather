//
//  Weather.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

struct Weather {
    var id: Int
    var main: String
    var descriptiom: String
    var icon: String
    
    init() {
        self.id = 0
        self.main = ""
        self.descriptiom = ""
        self.icon = ""
    }
}
