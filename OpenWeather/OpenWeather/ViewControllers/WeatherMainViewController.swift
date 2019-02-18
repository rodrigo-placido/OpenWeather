//
//  WeatherMainViewController.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 12/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import UIKit

class WeatherMainViewController: UIViewController {
    var segmentedControl: UISegmentedControl!
    private var listView: WeatherTableViewController
    private var mapView: WeatherMapViewController

    init(listView: WeatherTableViewController, mapView: WeatherMapViewController) {
        self.listView = listView
        self.mapView = mapView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        segmentedControl = UISegmentedControl(items: ["List", "Map"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        self.navigationItem.titleView = segmentedControl
        self.addButton()
        updateView()
    }
    
     @objc func changeUnit(_ sender: Any) {
        UserPreference.getShowFahrenheitTemp() ? UserPreference.setShowFahrenheitTemp(false) : UserPreference.setShowFahrenheitTemp(true)
        self.addButton()
       if segmentedControl.selectedSegmentIndex == 0 {
            listView.viewDidAppear(true)
       } else {
            mapView.viewDidAppear(true)
        }
    }
    
    private func addButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: UserPreference.getTitleButton(), style: .plain, target: self, action: #selector(changeUnit(_:)))
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: mapView)
            add(asChildViewController: listView)
        } else {
            remove(asChildViewController: listView)
            add(asChildViewController: mapView)
        }
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
    
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
    
        viewController.view.removeFromSuperview()
        
        viewController.removeFromParent()
    }
}
