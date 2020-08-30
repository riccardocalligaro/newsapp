//
//  ArticleCard.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import SwiftUI

struct ArticleCard: View {
    
    var article: Article
    
    var body: some View {
        Text(article.title!)
    }
}
//
//struct ArticleCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleCard(article: )
//    }
//}
