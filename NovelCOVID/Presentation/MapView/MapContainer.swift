//
//  MapContainer.swift
//  NovelCOVID
//
//  Created by Developer Bully on 06/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import MapKit
import SwiftUI
import Combine

struct MapContainer: UIViewRepresentable {
    
    //MARK: Variables
    
    @Binding var annotations: [MapAnnotation]
    
    var callbackForInfo: ((_ selectedAnnotation: MapAnnotation) -> Void)?
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapContainer
        
        init(_ control: MapContainer) {
            self.control = control
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation, let mapAnnotation = annotation as? MapAnnotation {
                let coordinates = annotation.coordinate
                let span = mapView.region.span
                let region = MKCoordinateRegion(center: coordinates, span: span)
                mapView.setRegion(region, animated: true)
                
                guard let block = self.control.callbackForInfo else {return}
                block(mapAnnotation)
            }
        }
    }
}
