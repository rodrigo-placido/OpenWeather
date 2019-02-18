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
    var listWeathers = CurrentWeatherList()
    
    public init(weatherViewModel: WeatherViewModel) {
        self.weatherViewModel = weatherViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView = MKMapView(frame: CGRect.zero)
        self.mapView.delegate = self
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.mapView)
        
        self.mapView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
        self.mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0).isActive = true
        self.mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LocationManager.sharedInstance.getLocation(startCallback: {
            print("DidStartLocation")
        }) { (location, error) in
            self.loadWeatherList(location!)
        }
    }
    
    func loadWeatherList(_ location: CLLocation) {
        self.weatherViewModel.getCurrentWeatherBy(lat: location.coordinate.latitude, lon:  location.coordinate.longitude) { (callback) in
            switch(callback){
            case .success(let list):
                self.listWeathers = list
                self.centerMapOnLocation(location)
                
                for location in self.listWeathers.currentWeatherList {
                    let annotation = MKPointAnnotation()
                    annotation.title = location.name
                    annotation.subtitle = "\(location.main.tempCelsius)"
                    annotation.coordinate = CLLocationCoordinate2D(latitude: location.coord.lat, longitude: location.coord.lon)
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }
    
}

extension WeatherMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if animated == false {
            let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
            self.loadWeatherList(location)
        }
    }
    
    private func centerMapOnLocation(_ location: CLLocation) {
        let regionRadius: CLLocationDistance = 50000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
}
