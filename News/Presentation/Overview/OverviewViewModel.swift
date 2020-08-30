//
//  OverviewViewModel.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class OverviewViewModel: ObservableObject {
    private let apiProvider: APIProvider = APIProvider<ArticlesEndpoints>()
    
    private var bag = Set<AnyCancellable>()
    
    @Published var loading = true
    @Published var error = ""
    @Published var headlines = Articles()
    
    func getTopHeadlines() {
        apiProvider.getData(from: ArticlesEndpoints.getTopHeadlines)
            .decode(type: ArticlesResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] (completion) in
                defer { self?.loading = false }
                
                switch completion {
                case .failure(let requestError):
                    self?.error = requestError.localizedDescription
                case .finished:
                    break
                }
                
                }, receiveValue: { [weak self] items in
                    self?.headlines = items
            })
            .store(in: &bag)
        
        
        
    }
}
