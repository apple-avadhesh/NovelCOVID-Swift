//
//  StatsView.swift
//  NovelCOVID
//
//  Created by Developer Bully on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    
    @State private var tabPicker: String = "Total"
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Text("Cases")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    Picker("", selection: $tabPicker) {
                        Text("Total").tag("Total")
                        Text("Today's").tag("Today's")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
            }
            .navigationBarTitle(Text("Novel Coronavirus"))
            .navigationBarHidden(false)
            .environment(\.colorScheme, .dark)
        }
    }
}


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .environment(\.colorScheme, .dark)
    }
}
