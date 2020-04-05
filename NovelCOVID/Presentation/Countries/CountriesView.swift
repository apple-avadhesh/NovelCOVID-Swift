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
    
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]

    
    var body: some View {
        
        NavigationView {
            VStack {
                
                // Search view
                SearchBar(searchText: $searchText)
                
                List {
                    // Filtered list of names
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                }
                .navigationBarTitle(Text("Countries"))
                .resignKeyboardOnDragGesture()
            }
        }
    }
}


struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .environment(\.colorScheme, .dark)
    }
}
