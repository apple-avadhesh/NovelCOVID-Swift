//
//  CountriesViewModel.swift
//  NovelCOVID
//
//  Created by Developer Bully on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

final class CountriesViewModel: ObservableObject {
    
    var didChange = PassthroughSubject<CountriesViewModel, Never>()
    
    var cancellable : AnyCancellable?

    @Published var countries: [CountryModel] = [CountryModel]() {
        didSet { didChange.send(self) }
    }
    
    func getCountriesData() {
        cancellable = NovelCOVIDAPI.getAllCountries().sink(receiveCompletion: { (completion) in
            switch completion {
                
            case .finished:
                print("finished")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }) { (countries) in
            self.countries = countries.sorted(by: {$0.cases! > $1.cases!})
        }
    }
}
