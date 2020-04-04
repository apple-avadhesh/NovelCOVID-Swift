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
    static let manager = NetAvadheshManager()
    static let base = URL(string: "https://corona.lmao.ninja")!
}

extension NovelCOVIDAPI {
        
    static func allCases() -> AnyPublisher<[AllCasesModel], Error> {
        return execute(URLRequest(url: base.appendingPathComponent("all")))
    }
    
    static func allCountries(repo: String, owner: String) -> AnyPublisher<[CountryModel], Error> {
        return execute(URLRequest(url: base.appendingPathComponent("countries?sort=country")))
    }
    
    static func execute<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return manager.execute(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
