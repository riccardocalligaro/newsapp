//
//  APIErrors.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import Foundation

enum APIErrors: Int, LocalizedError {
    case badRequest = 400
    case unauthorized = 401
    case tooManyRequests = 429
    case serverError = 500
    
    var errorDescription: String? {
        switch self {
        case .tooManyRequests:
            return "You made too many requests, retry later."
        case .serverError:
            return "Server problem, not your fault"
        default:
            return "Something went wrong"
        }
    }
}
