//
//  ArticlesResponse.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: String
    let articles: Articles
}
