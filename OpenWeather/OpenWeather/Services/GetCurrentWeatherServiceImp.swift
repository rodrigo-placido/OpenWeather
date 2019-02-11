//
//  GetCurrentWeatherServiceImp.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Alamofire

class GetCurrentWeatherServiceImp: GetCurrentWeatherService {
   
    func getCurrentWeatherBy(lat: String,
                             lon: String,
                             completion: ((_ currentWeather: [CurrentWeather?], _ error: ApiError?) -> Void)?) {
        Alamofire.request(ApiConfig.getUrlFindByCoordinates(lat: "-22", lon: "-22"))
            .validate(statusCode: ApiConfig.statusCodeValid)
            .responseData { response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
                }
            }
    }
}
