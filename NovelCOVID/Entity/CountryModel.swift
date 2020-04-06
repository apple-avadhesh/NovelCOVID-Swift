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


////MARK: CountryModel
//
//struct CountryModel : Codable, Identifiable{
//    var id = UUID()
//    let country : String?
//    let countryInfo : CountryInfo?
//    let cases : Int?
//    let todayCases : Int?
//    let deaths : Int?
//    let todayDeaths : Int?
//    let recovered : Int?
//    let active : Int?
//    let critical : Int?
//    let casesPerOneMillion : Double?
//    let deathsPerOneMillion : Double?
//    let updated : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case country = "country"
//        case countryInfo = "countryInfo"
//        case cases = "cases"
//        case todayCases = "todayCases"
//        case deaths = "deaths"
//        case todayDeaths = "todayDeaths"
//        case recovered = "recovered"
//        case active = "active"
//        case critical = "critical"
//        case casesPerOneMillion = "casesPerOneMillion"
//        case deathsPerOneMillion = "deathsPerOneMillion"
//        case updated = "updated"
//        case id
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
//        country = try values.decodeIfPresent(String.self, forKey: .country)
//        countryInfo = try values.decodeIfPresent(CountryInfo.self, forKey: .countryInfo)
//        cases = try values.decodeIfPresent(Int.self, forKey: .cases)
//        todayCases = try values.decodeIfPresent(Int.self, forKey: .todayCases)
//        deaths = try values.decodeIfPresent(Int.self, forKey: .deaths)
//        todayDeaths = try values.decodeIfPresent(Int.self, forKey: .todayDeaths)
//        recovered = try values.decodeIfPresent(Int.self, forKey: .recovered)
//        active = try values.decodeIfPresent(Int.self, forKey: .active)
//        critical = try values.decodeIfPresent(Int.self, forKey: .critical)
//        casesPerOneMillion = try values.decodeIfPresent(Double.self, forKey: .casesPerOneMillion)
//        deathsPerOneMillion = try values.decodeIfPresent(Double.self, forKey: .deathsPerOneMillion)
//        updated = try values.decodeIfPresent(Int.self, forKey: .updated)
//    }
//
//}
//
////MARK: CountryInfo
//struct CountryInfo : Codable {
//    let _id : Int?
//    let iso2 : String?
//    let iso3 : String?
//    let lat : Int?
//    let long : Int?
//    let flag : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case _id = "_id"
//        case iso2 = "iso2"
//        case iso3 = "iso3"
//        case lat = "lat"
//        case long = "long"
//        case flag = "flag"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        _id = try values.decodeIfPresent(Int.self, forKey: ._id)
//        iso2 = try values.decodeIfPresent(String.self, forKey: .iso2)
//        iso3 = try values.decodeIfPresent(String.self, forKey: .iso3)
//        lat = try values.decodeIfPresent(Int.self, forKey: .lat)
//        long = try values.decodeIfPresent(Int.self, forKey: .long)
//        flag = try values.decodeIfPresent(String.self, forKey: .flag)
//    }
//}
