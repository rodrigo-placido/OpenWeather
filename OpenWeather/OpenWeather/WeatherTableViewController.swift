//
//  WeatherTableViewController.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 13/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherTableViewController: UITableViewController {
    let weatherViewModel: WeatherViewModel
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
        self.view.backgroundColor = .blue
        self.tableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: "WeatherListTableViewCell")
        self.tableView.tableFooterView = UIView()
        weatherViewModel.getCurrentWeatherBy(lat: "", lon: "") { (callback) in
            switch(callback){
            case .success(let list):
                self.listWeathers = list
                self.tableView.reloadData()
                break
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
        cell.iconImageView.kf.setImage(with: URL(string: currentWeather.weather[0].iconUrl))
        return cell
    }
}

