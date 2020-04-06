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
}

extension NovelCOVIDAPI {
    
    static func allCases() -> AnyPublisher<[AllCasesModel], Error> {
        return execute(URLRequest(url: baseURL.appendingPathComponent("all")))
    }
    
    static func allCountries() -> AnyPublisher<[CountryModel], Error> {
        
        let urlComponents = NSURLComponents(string: baseURL.absoluteString)!
        urlComponents.queryItems = [
          URLQueryItem(name: "sort", value: "country")
        ]
        return execute(URLRequest(url: urlComponents.url!.appendingPathComponent("countries")))
    }
    
    static func execute<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return manager.execute(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
