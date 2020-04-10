//
//  StatsViewModel.swift
//  NovelCOVID
//
//  Created by Developer Bully on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import Combine


enum StatsTabType: String, CaseIterable {
    case cases = "Cases"
    case deaths = "Deaths"
    case recovered = "Recovered"
}

final class StatsViewModel: ObservableObject {
    
    var didChange = PassthroughSubject<StatsViewModel, Never>()
    
    var cancellable : AnyCancellable?

    @Published var pointEntries: [PointEntry] = [PointEntry]() {
        didSet { didChange.send(self) }
    }
    
    func getDailyData(tabType: Int) {
        cancellable = NovelCOVIDAPI.getDailyStats().sink(receiveCompletion: { (completion) in
            switch completion {
                
            case .finished:
                print("finished")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }) { (dailyDataModel) in
            
            self.pointEntries = self.generatePointEntries(dailyDataModel.data, tabType: tabType)
        }
    }
    
    private func generatePointEntries(_ dailyRecords: [DailyData], tabType: Int) -> [PointEntry] {
        
        let dates = Set(dailyRecords.map{$0.date}).sorted(by: { $0.compare($1) == .orderedAscending })
        var localPointEntries = [PointEntry]()
        for date in dates {
            var combinedValue = Int()
            
            for record in dailyRecords {
                
                if record.date == date {
                    switch tabType {
                   
                    case 0:
                        combinedValue += Int(record.cases)!
                    case 1:
                        combinedValue += Int(record.deaths)!
                    case 2:
                        combinedValue += Int(record.recovered)!
                    default:
                        combinedValue += Int(record.cases)!
                    }
                }
            }
            localPointEntries.append(PointEntry(value: combinedValue, label: date))

        }
        return localPointEntries
    }
}




