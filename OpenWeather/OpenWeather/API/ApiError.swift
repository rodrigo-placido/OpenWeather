//
//  ApiError.swift
//  OpenWeather
//
//  Created by Rodrigo Goncalez on 11/02/19.
//  Copyright © 2019 Rodrigo Goncalez. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case unauthorized
    case serverError
    case serviceUnavailable
    case unknown
}

extension ApiError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .unauthorized:
            return "Erro de autorização"
        case .serverError:
            return "Erro interno do servidor"
        case .serviceUnavailable:
            return "Serviço temporariamente indisponível"
        case .unknown:
            return "Erro desconhecido"
        }
    }
}
