//
//  WeatherMapViewController.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 14/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import UIKit
import MapKit
import SVProgressHUD

class WeatherMapViewController: UIViewController {
    let weatherViewModel: WeatherViewModel
    var currentWeatherList = CurrentWeatherList()
    var mapView = MKMapView()
    var listWeathers = CurrentWeatherList()
    private var mapChangedFromUserInteraction = false
    
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
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.didDragMap(_:)))
        panGesture.delegate = self
        self.mapView.addGestureRecognizer(panGesture)
        
        self.mapView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
        self.mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0).isActive = true
        self.mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.load()
    }
    
    private func load() {
        LocationManager.sharedInstance.getLocation(startCallback: {
            print("DidStartLocation")
        }) { (location, error) in
            if (error == nil) {
                self.loadWeatherList(location!)
            } else {
                let alert = UIAlertController(title: "Atenção", message: "Por favor ative o uso da localização para usar o app", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func loadWeatherList(_ location: CLLocation) {
        self.weatherViewModel.getCurrentWeatherBy(lat: location.coordinate.latitude, lon:  location.coordinate.longitude) { (callback) in
            switch(callback){
            case .success(let list):
                self.listWeathers = list
                self.buildMApView(location)
                SVProgressHUD.dismiss()
                break
            case .loading:
                SVProgressHUD.show(withStatus: "Carregando...")
                break
            case .error(let error):
                self.showError(error)
                SVProgressHUD.dismiss()
                break
            }
        }
    }
    
    private func buildMApView(_ location: CLLocation) {
        self.centerMapOnLocation(location)
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        for location in self.listWeathers.currentWeatherList {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.subtitle = "\(location.main.selectedTemp!)"
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.coord.lat, longitude: location.coord.lon)
            self.mapView.addAnnotation(annotation)
        }
    }
    
    private func showError(_ apiError: ApiError) {
        let alert = UIAlertController(title: "Erro", message: apiError.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Recarregar", style: UIAlertAction.Style.default, handler: { action in
            self.load()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension WeatherMapViewController: MKMapViewDelegate {
    @objc func didDragMap(_ sender: UIGestureRecognizer) {
        if sender.state == .ended {
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

extension WeatherMapViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
