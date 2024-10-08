//
//  AnyPublisher+NetworkResponse.swift
//  NetworkLayer
//
//  Created by Vladyslav Lysenko on 27.08.2024.
//

import Combine

public extension AnyPublisher where Output == Network.Response, Failure == NetworkError {
    func decode<T: Decodable>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, NetworkError> {
        map(\.data)
            .decode(type: type, decoder: decoder)
            .mapError(NetworkError.init)
            .eraseToAnyPublisher()
    }
}
