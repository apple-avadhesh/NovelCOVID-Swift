//
//  ContentView.swift
//  NovelCOVID
//
//  Created by Avadhesh on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI

//MARK: TabItem
private struct TabItem: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}

struct ContentView: View {
    
    
    var countryViewModel: CountriesViewModel
    var mapViewModel: MapViewModel
    
    init() {
        countryViewModel = CountriesViewModel()
        mapViewModel = MapViewModel()
    }
    
    
    var body: some View {
        
        TabView {
            StatsView()
                .tabItem {
                    TabItem(imageName: "chart.pie", text: "World Stats")
                    Text("World Stats")
            }
            
            CountriesView(viewModel: countryViewModel)
                .tabItem {
                    TabItem(imageName: "globe", text: "Countries")
                    Text("Countries")
            }
            
            MapView(viewModel: mapViewModel)
                          .tabItem {
                              TabItem(imageName: "map", text: "Map")
                              Text("World Stats")
                      }
        }.environment(\.colorScheme, .dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}

