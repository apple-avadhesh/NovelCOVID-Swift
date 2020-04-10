//
//  AllCountriesModel.swift
//  NovelCOVID
//
//  Created by Avadhesh on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import Foundation

// MARK: - CountryModel
struct CountryModel: Codable, Identifiable {
    var id: String?
    let country: String?
    let countryInfo: CountryInfo?
    let updated, cases, todayCases, deaths: Int?
    let todayDeaths, recovered, active, critical: Int?
    let casesPerOneMillion, deathsPerOneMillion: Double?
    let tests, testsPerOneMillion: Int?
}

// MARK: - CountryInfo
struct CountryInfo: Codable {
    let id: Int?
    let iso2, iso3: String?
    let lat, long: Double?
    let flag: String?

    enum CodingKeys: String, CodingKey {
        case id
        case iso2, iso3, lat, long, flag
    }
}
