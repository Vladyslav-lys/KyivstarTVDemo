//
//  APIResponse.swift
//  NetworkLayer
//
//  Created by Vladyslav Lysenko on 27.08.2024.
//

import Foundation

public struct APIResponse<Value> {
    public let data: Value

    func map<T>(_ transform: (Value) throws -> T) rethrows -> APIResponse<T> {
        let newData = try transform(data)
        return APIResponse<T>(data: newData)
    }
}

extension APIResponse: Decodable where Value: Decodable {}
