//
//  WeatherTableViewController.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 13/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import UIKit
import Kingfisher
import CoreLocation
import SVProgressHUD

class WeatherTableViewController: UITableViewController {
    let weatherViewModel: WeatherViewModel
    var locationManager: LocationManager
    var listWeathers = CurrentWeatherList()

    public init(weatherViewModel: WeatherViewModel) {
        self.weatherViewModel = weatherViewModel
        self.locationManager = LocationManager()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: "WeatherListTableViewCell")
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.loadWeatherList()
    }
    
    func loadWeatherList() {
        LocationManager.sharedInstance.getLocation(startCallback: {
            print("DidStartLocation")
        }) { (location, error) in
            if (error == nil) {
                self.weatherViewModel.getCurrentWeatherBy(lat: location!.coordinate.latitude, lon:  location!.coordinate.longitude) { (callback) in
                    switch(callback){
                    case .success(let list):
                        self.listWeathers = list
                        self.tableView.reloadData()
                        SVProgressHUD.dismiss()
                        break
                    case .loading():
                        SVProgressHUD.show(withStatus:"Carregando...")
                        break
                    case .error(let error):
                        self.showError(error)
                        SVProgressHUD.dismiss()
                        break
                    }
                }
            } else {
                let alert = UIAlertController(title: "Atenção", message: "Por favor ative o uso da localização para usar o app", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listWeathers.currentWeatherList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListTableViewCell") as! WeatherListTableViewCell
        let currentWeather = listWeathers.currentWeatherList[indexPath.row]
        cell.nameLabel.text = currentWeather.name
        cell.distanceLabel.text =  "\((currentWeather.coord.distance! / 1000).rounded())Km"
        cell.iconImageView.kf.setImage(with: URL(string: currentWeather.weather[0].iconUrl))
        cell.tempLabel.text = "\(currentWeather.main.selectedTemp!)"
        return cell
    }
    
    private func showError(_ apiError: ApiError) {
        let alert = UIAlertController(title: "Erro", message: apiError.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Recarregar", style: UIAlertAction.Style.default, handler: { action in
            self.loadWeatherList()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

