//
//  OpenWeatherTests.swift
//  OpenWeatherTests
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import XCTest
@testable import OpenWeather

class OpenWeatherTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApi() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let viewModel = WeatherViewModel(getCurrentWeatherService: GetCurrentWeatherServiceStub())
        viewModel.getCurrentWeatherBy(lat: -23.5489, lon: -46.6388) { (callback) in
            switch(callback){
            case .success(let list):
                XCTAssertEqual(list.currentWeatherList.count, 1, "")
                XCTAssertEqual(list.currentWeatherList[0].name, "São Paulo", "")
                XCTAssertEqual(list.currentWeatherList[0].main.tempCelsius, "22°C", "")
                XCTAssertEqual(list.currentWeatherList[0].main.tempFahrenheit, "71.6°F", "")
                XCTAssertEqual(list.currentWeatherList[0].coord.distance, 0.0, "")
                XCTAssertEqual(list.currentWeatherList[0].weather[0].iconUrl, "http://openweathermap.org/img/w/10n.png", "")
                break
            case .loading():
                break
            case .error(_):
                
                break
            }
        }
    }

    func testErrors() {
        XCTAssertEqual(ParseError.getErrorFromStatusCode(statusCode: 401).localizedDescription, "Erro de autorização", "")
        XCTAssertEqual(ParseError.getErrorFromStatusCode(statusCode: 500).localizedDescription, "Erro interno do servidor", "")
        XCTAssertEqual(ParseError.getErrorFromStatusCode(statusCode: 503).localizedDescription, "Serviço temporariamente indisponível", "")
        XCTAssertEqual(ApiError.unknown.localizedDescription, "Erro desconhecido", "")
    }

}
