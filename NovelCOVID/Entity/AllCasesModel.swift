//
//  AllCasesModel.swift
//  NovelCOVID
//
//  Created by Avadhesh on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import Foundation

struct AllCasesModel : Codable {
    let cases : Int?
    let todayCases : Int?
    let deaths : Int?
    let todayDeaths : Int?
    let recovered : Int?
    let active : Int?
    let critical : Int?
    let casesPerOneMillion : Int?
    let deathsPerOneMillion : Double?
    let updated : Int?
    let affectedCountries : Int?

    enum CodingKeys: String, CodingKey {

        case cases = "cases"
        case todayCases = "todayCases"
        case deaths = "deaths"
        case todayDeaths = "todayDeaths"
        case recovered = "recovered"
        case active = "active"
        case critical = "critical"
        case casesPerOneMillion = "casesPerOneMillion"
        case deathsPerOneMillion = "deathsPerOneMillion"
        case updated = "updated"
        case affectedCountries = "affectedCountries"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cases = try values.decodeIfPresent(Int.self, forKey: .cases)
        todayCases = try values.decodeIfPresent(Int.self, forKey: .todayCases)
        deaths = try values.decodeIfPresent(Int.self, forKey: .deaths)
        todayDeaths = try values.decodeIfPresent(Int.self, forKey: .todayDeaths)
        recovered = try values.decodeIfPresent(Int.self, forKey: .recovered)
        active = try values.decodeIfPresent(Int.self, forKey: .active)
        critical = try values.decodeIfPresent(Int.self, forKey: .critical)
        casesPerOneMillion = try values.decodeIfPresent(Int.self, forKey: .casesPerOneMillion)
        deathsPerOneMillion = try values.decodeIfPresent(Double.self, forKey: .deathsPerOneMillion)
        updated = try values.decodeIfPresent(Int.self, forKey: .updated)
        affectedCountries = try values.decodeIfPresent(Int.self, forKey: .affectedCountries)
    }

}
