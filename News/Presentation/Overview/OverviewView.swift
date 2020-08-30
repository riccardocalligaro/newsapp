//
//  OverviewView.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import SwiftUI

struct OverviewView: View {
    @ObservedObject var viewModel = OverviewViewModel()
    
    var body: some View {
        NavigationView(content: {
            
            
            List {
                if viewModel.loading {
                    ActivityIndicator()
                } else if !viewModel.headlines.isEmpty {
                    Section(header: Text("Latest news")) {
                        TopHeadlinesView(topHeadlines: viewModel.headlines)
                            .frame(height: UIScreen.main.bounds.width / 4 * 3,
                                   alignment: .center)
                            .listRowInsets(EdgeInsets())
                    }
                    
                    
                    Section(header: Text("Sections")) {
                        Text("Sections")
                    }
                }
                //                Spacer()
            }
                //            .padding()
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)

                
                
                .animation(.spring())
                .navigationBarTitle(Text("Home"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    // update the headlines
                    self.viewModel.getTopHeadlines()
                }, label: {
                    Image(systemName: "arrow.2.circlepath")
                        .imageScale(.large)
                }))
            
        })
        
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
