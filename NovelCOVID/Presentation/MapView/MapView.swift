//
//  MapView.swift
//  NovelCOVID
//
//  Created by Developer Bully on 06/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    @ObservedObject var viewModel: MapViewModel
    
    @State var showPopup = false
    
    @State var selectedAnnotation: MapAnnotation?

    
    var body: some View {
        
         ZStack {

            MapContainer(annotations: $viewModel.annotations, callbackForInfo: { callBackAnnotation in
                self.selectedAnnotation = callBackAnnotation
                self.showPopup.toggle()
            }).edgesIgnoringSafeArea(.vertical)
                
                if self.showPopup {
                    GeometryReader {_ in
                        CalloutView(country: (self.selectedAnnotation?.countryModel)!)
                    }.background(
                        Color.black.opacity(0.60)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                withAnimation {
                                    self.showPopup.toggle()
                                }
                        }
                    )
                }
        }.onAppear {
            //MARK: Service Call
            self.viewModel.getMapData()
        }
    }
}
