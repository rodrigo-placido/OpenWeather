//
//  UIColor+Convenience.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 17/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//
import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat) {
        self.init(red: CGFloat(CFloat(r) / 255.0), green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}

