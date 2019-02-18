//
//  GetCurrentWeatherServiceImp.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

class GetCurrentWeatherServiceImp: GetCurrentWeatherService {
    
    func getCurrentWeatherBy(latMin: Double,
                             latMax: Double,
                             lonMin: Double,
                             lonMax: Double,
                             completion: @escaping ((_ currentWeather: CurrentWeatherList?, _ error: ApiError?) -> Void)) {
        
        Alamofire.request(ApiConfig.getUrlFindByCoordinates(latMin: latMin, latMax: latMax, lonMin: lonMin, lonMax: lonMax))
            .validate(statusCode: ApiConfig.statusCodeValid)
            .responseJSON{ response in
                switch response.result {
                case .success:
                    do {
                        guard let listWeatherData = response.result.value else { return }
                        let currentWeatherList: CurrentWeatherList = try unbox(dictionary: listWeatherData as! UnboxableDictionary)
                        completion(currentWeatherList, nil)
                    } catch {
                        completion(nil, ApiError.unknown)
                    }
                    break
                case .failure(_):
                    completion(nil, self.parseError(fromResponse: response))
                    break
                }
        }
    }
    
    private func parseError<T>(fromResponse response: DataResponse<T>) -> ApiError {
        guard let statusCode = response.response?.statusCode else { return ApiError.unknown }
        
        switch statusCode {
        case 401:
            return ApiError.unauthorized
        case 500:
            return ApiError.serverError
        case 503:
            return ApiError.serviceUnavailable
        default:
            return ApiError.unknown
        }
    }
}
