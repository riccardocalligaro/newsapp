//
//  APIProvider.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import Foundation
import Combine


class APIProvider<Endpoint: EndpointProtocol> {
    func getData(from endpoint: Endpoint) -> AnyPublisher<Data, Error> {
        guard let request = performRequest(for: endpoint) else {
            return Fail(error: APIProviderErrors.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return loadData(with: request)
            .eraseToAnyPublisher()
    }
    
    private func performRequest(for endpoint: Endpoint) -> URLRequest? {
        guard var urlComponents = URLComponents(string: endpoint.baseURL + endpoint.path) else {
            return nil
        }
        
        urlComponents.queryItems = endpoint.params.compactMap({ param -> URLQueryItem in
            return URLQueryItem(name: param.key, value: param.value)
        })
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 30)
        
        endpoint.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return urlRequest
    }
    
    private func loadData(with request: URLRequest) -> AnyPublisher<Data, Error> {
        print(request)

        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError({error -> Error in
                APIErrors(rawValue: error.code.rawValue) ?? APIProviderErrors.unknownError
            })
            .map {$0.data}
            .eraseToAnyPublisher()
    }
}
