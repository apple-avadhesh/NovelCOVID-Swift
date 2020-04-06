//
//  CountriesView.swift
//  NovelCOVID
//
//  Created by Developer Bully on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI

struct CountriesView: View {
    
    @State private var searchText : String = ""
    
    @ObservedObject var viewModel: CountriesViewModel

    var body: some View {
        
        NavigationView {
            VStack {
                //MARK: Search View
                SearchBar(searchText: $searchText)
                
                //MARK: List View
                List(viewModel.countries,id: \.country) { country in
                              NavigationLink(destination: CountryCell(country: country)) {
                                  CountryCell(country: country)
                              }
                          }
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
            }
        }.onAppear {
            //MARK: Service Call
            self.viewModel.getCountriesData()
        }
    }
}


struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .environment(\.colorScheme, .dark)
    }
}
