//
//  TopHeadlinesView.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import SwiftUI

struct TopHeadlinesView: View {
    
    let topHeadlines: Articles
    
    var body: some View {
        PageView(topHeadlines.map{ TopHeadlineRow(article: $0) })
    }
}

