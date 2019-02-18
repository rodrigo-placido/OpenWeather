//
//  UserPreference.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 17/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import UIKit

class UserPreference {
    static func setShowFahrenheitTemp(_ showFahrenheit: Bool) {
        UserDefaults.standard.set(showFahrenheit, forKey: "showFahrenheit")
    }
    
    static func getShowFahrenheitTemp() -> Bool{
       return UserDefaults.standard.bool(forKey: "showFahrenheit")
    }
    
    static func getTitleButton() -> String {
      return UserDefaults.standard.bool(forKey: "showFahrenheit") ? "Celsius" : "Fahrenheit"
    }
}
