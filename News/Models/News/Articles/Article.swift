//
//  Article.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import Foundation

typealias Articles = [Article]

struct Article: Codable, Hashable {
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let url: URL
    let urlToImage: String?
}


extension Article {
    static func getMock() -> Article {
        return Article(source: ArticleSource(id: "washington-post", name: "The Washington Post"), author: "John Doe", title: "Sample title", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut ultrices magna. Suspendisse tincidunt purus id mauris dictum, quis eleifend libero posuere.", url: URL(string: "https://www.washingtonpost.com/nation/2020/08/29/blm-activists-counterprotesters-clash-portland-leading-arrests/?hpid=hp_hp-top-table-high_portlandprotest-1211am%3Ahomepage%2Fstory-ans&itid=hp_hp-top-table-high_portlandprotest-1211am%3Ahomepage%2Fstory-ans")!, urlToImage: "https://miro.medium.com/max/3000/1*MI686k5sDQrISBM6L8pf5A.jpeg")
    }
}
