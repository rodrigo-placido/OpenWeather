//
//  ViewController.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let service = GetCurrentWeatherServiceImp()
        service.getCurrentWeatherBy(lat: "22", lon: "22") { (currentWeather, error) in
            print(currentWeather)
        }
    }


}

