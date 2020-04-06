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
                List(viewModel.countries.filter {
                    self.searchText.isEmpty ? true : $0.country!.localizedStandardContains(self.searchText)
                },id: \.country) { country in
                    
                    ZStack {
                        CountryCell(country: country)
                        NavigationLink(destination: CountryCell(country: country)) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationBarTitle(Text("Search by Country"))
                .resignKeyboardOnDragGesture()
            }
        }.onAppear {
            //MARK: Service Call
            self.viewModel.getCountriesData()
        }
    }
}
