//
//  APIProviderError.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import Foundation

enum APIProviderErrors: LocalizedError {
    case invalidURL
    case dataNil
    case decodingError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .dataNil:
            return "Empty data."
        case .decodingError:
            return "Data has invalid format."
        default:
            return "Something went wrong."
        }
    }
}
