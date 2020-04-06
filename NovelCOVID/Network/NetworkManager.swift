//
//  dfsfsd.swift
//  NovelCOVID
//
//  Created by Avadhesh on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import Foundation
import Combine

struct NetworkManager {
    let session = URLSession.shared
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func execute<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                print(T.self)
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
