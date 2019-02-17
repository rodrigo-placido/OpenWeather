//
//  Main.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 17/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Unbox

class Main: Unboxable {
    let temp: Int
    
    required init(unboxer: Unboxer) throws {
        self.temp = try unboxer.unbox(key: "temp")
    }
    
    init() {
        self.temp = 0
    }
}
