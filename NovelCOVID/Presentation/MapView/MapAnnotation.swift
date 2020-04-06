//
//  MapAnnotation.swift
//  NovelCOVID
//
//  Created by Developer Bully on 06/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {

    let coordinate: CLLocationCoordinate2D
    let title: String?
    let countryModel: CountryModel?
    let subtitle: String?

    init(coordinate: CLLocationCoordinate2D,
         title: String? = nil,
         countryModel: CountryModel? = nil,
         subtitle: String? = nil) {
        self.coordinate = coordinate
        self.countryModel = countryModel
        self.title = title
        self.subtitle = subtitle
    }
}
