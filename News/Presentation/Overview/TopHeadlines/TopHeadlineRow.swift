//
//  TopHeadlineRow.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct TopHeadlineRow: View {
    @State private var shouldPresentURL: Bool = false
    @State private var shouldShowShareSheet: Bool = false
    
    var article: Article
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .frame(
                width: UIScreen.main.bounds.width - 32,
                height: UIScreen.main.bounds.width / 4 * 3,
                alignment: .center
            )
                .aspectRatio(contentMode: .fit)
            
            
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.6)
                .frame(
                    height: UIScreen.main.bounds.width / 4 * 3,
                    alignment: .center)
            
            Button(
                action: {
                    self.shouldPresentURL = true
            },
                label: {
                    topHeadlineInfo
            }
            )
        }.frame(
            width: UIScreen.main.bounds.width - 32,
            height: UIScreen.main.bounds.width / 4 * 3,
            alignment: .center
        )
            .contextMenu {
                Button(
                    action: {
                        //                    LocalArticle.saveArticle(self.article)
                        //                    CoreDataManager.shared.saveContext()
                },
                    label: {
                        Text("Add to favorites")
                        Image(systemName: "heart.fill")
                }
                )
                Button(
                    action: {
                        self.shouldShowShareSheet.toggle()
                },
                    label: {
                        Text("Share")
                        Image(systemName: "square.and.arrow.up")
                }
                )
        }
        .sheet(isPresented: $shouldPresentURL) {
            SafariView(url: self.article.url)
        }
        //        .sheet(isPresented: $shouldShowShareSheet) {
        //            ActivityViewController(activityItems: [
        //                self.article.title ?? "",
        //                self.article.url
        //            ])
        //        }
    }
    
    private var topHeadlineInfo: some View {
        VStack(alignment: .leading) {
            Text(verbatim: article.source?.name ?? "")
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(nil)
                .padding([.leading, .trailing])
            
            Text(verbatim: article.title ?? "")
                .foregroundColor(.white)
                .font(.headline)
                .lineLimit(nil)
                .padding([.leading, .bottom, .trailing])
        }
    }
}

struct TopHeadlineRow_Previews: PreviewProvider {
    static var previews: some View {
        TopHeadlineRow(article: Article.getMock())
            .previewDevice(.none)
            .previewLayout(.fixed(width: UIScreen.main.bounds.width - 32,  height: UIScreen.main.bounds.width / 4 * 3))
            .previewDisplayName("Article card")
    }
    
}
