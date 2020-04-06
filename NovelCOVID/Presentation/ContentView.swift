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
    
    init() {
        countryViewModel = CountriesViewModel()
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
        }.environment(\.colorScheme, .dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}

