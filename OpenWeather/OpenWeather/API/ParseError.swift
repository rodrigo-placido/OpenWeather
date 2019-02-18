//
//  ParseError.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 18/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation
import Alamofire

class ParseError {
    static func parseError<T>(fromResponse response: DataResponse<T>) -> ApiError {
        guard let statusCode = response.response?.statusCode else { return ApiError.unknown }
        return self.getErrorFromStatusCode(statusCode: statusCode)
    }
    
    static func getErrorFromStatusCode(statusCode: Int) -> ApiError {
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
