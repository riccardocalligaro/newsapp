//
//  ArticlesEndpoints.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import Foundation

enum ArticlesEndpoints: EndpointProtocol {
    case getTopHeadlines

    var baseURL: String {
        return "https://newsapi.org/v2"
    }
    
    var path: String {
        switch self {
        case .getTopHeadlines:
            return "/top-headlines"
        }
    }
    
    var params: [String : String] {
        switch self {
        case .getTopHeadlines:
            return ["country": region]
        }
    }
    
    var headers: [String : String] {
        return [
            "X-Api-Key": "dee8455fc09144b5afbfa4cfa0b052db",
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    
    
}
