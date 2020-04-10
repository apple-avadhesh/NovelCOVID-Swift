//
//  APIEndpoints.swift
//  NovelCOVID
//
//  Created by Avadhesh on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import Foundation
import Combine

enum NovelCOVIDAPI {
    static let manager = NetworkManager()
    static let baseURL = URL(string: "https://corona.lmao.ninja")!
    static let dailyStatsURL = URL(string: "https://thevirustracker.com/timeline/map-data.json")!

}

extension NovelCOVIDAPI {
    
    static func getAllCountries() -> AnyPublisher<[CountryModel], Error> {
        
        let urlComponents = NSURLComponents(string: baseURL.absoluteString)!
        urlComponents.queryItems = [
          URLQueryItem(name: "sort", value: "country")
        ]
        return execute(URLRequest(url: urlComponents.url!.appendingPathComponent("countries")))
    }
    
    static func getDailyStats() -> AnyPublisher<DailyStatsModel, Error> {
           return execute(URLRequest(url: dailyStatsURL))
       }
    
    static func execute<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return manager.execute(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
