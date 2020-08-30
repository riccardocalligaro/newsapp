//
//  ContentView.swift
//  News
//
//  Created by Riccardo on 30/08/2020.
//  Copyright © 2020 Riccardo. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    

    var body: some View {
        TabView {
            OverviewView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
            }
        }
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
