//
//  StatsView.swift
//  NovelCOVID
//
//  Created by Developer Bully on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import Charts
import Combine

class TabManager: ObservableObject {
    @Published var index = 0 {
        didSet {
            publisher.send(index)
        }
    }
    let publisher = PassthroughSubject<Int, Never>()
}

struct StatsView: View {
    
    @ObservedObject var viewModel: StatsViewModel
    
    static let pickerItems = StatsTabType.allCases.map{$0.rawValue}
    @ObservedObject private var tabManager = TabManager()
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("World Stats")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    Picker(selection: $tabManager.index, label: Text("")) {
                    ForEach(0 ..< StatsView.pickerItems.count) {index in
                        Text(StatsView.pickerItems[index]).tag(index)
                        }
                    }
                        
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                .onReceive(tabManager.publisher) { index in
                    self.viewModel.getDailyData(tabType: index)
                }
                }
                
                VStack {
                    GraphViewWrapper(dataEntries: viewModel.pointEntries)
                }
            }
                
            .navigationBarTitle(Text("Novel Coronavirus"))
            .navigationBarHidden(false)
            .environment(\.colorScheme, .dark)
        }.onAppear {
            self.viewModel.getDailyData(tabType: 0)
        }
    }
}

