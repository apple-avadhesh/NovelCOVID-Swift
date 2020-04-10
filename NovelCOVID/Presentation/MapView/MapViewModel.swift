//
//  MapViewModel.swift
//  NovelCOVID
//
//  Created by Developer Bully on 06/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import Combine
import Foundation
import MapKit


final class MapViewModel: ObservableObject {
    

    var didChange = PassthroughSubject<MapViewModel, Never>()
    
    @Published var annotations: [MapAnnotation] = [MapAnnotation]() {
           didSet { didChange.send(self) }
    }
    
    @State var selectedAnnotation: MapAnnotation? = nil

    var cancellable : AnyCancellable?

    func getMapData() {
        cancellable = NovelCOVIDAPI.getAllCountries().sink(receiveCompletion: { (completion) in
            switch completion {
                
            case .finished:
                print("finished")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }) { (countries) in
            self.annotations = countries.map{MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: ($0.countryInfo?.lat)!, longitude: ($0.countryInfo?.long)!), title: "\($0.country!)", countryModel:$0, subtitle: "")}
        }
    }
}
