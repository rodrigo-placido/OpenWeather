//
//  WeatherMapViewController.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 14/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import UIKit
import MapKit

class WeatherMapViewController: UIViewController {
    let weatherViewModel: WeatherViewModel
    var currentWeatherList = CurrentWeatherList()
    var mapView = MKMapView()
    
    public init(weatherViewModel: WeatherViewModel) {
        self.weatherViewModel = weatherViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
}
