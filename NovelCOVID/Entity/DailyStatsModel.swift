//
//  StatsModel.swift
//  NovelCOVID
//
//  Created by Developer Bully on 07/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import Foundation


// MARK: - Stats
struct DailyStatsModel: Codable {
    var data: [DailyData]
}

// MARK: - Datum
struct DailyData: Codable {
    var countrycode: String
    var date: String
    var cases, deaths, recovered: String
}
