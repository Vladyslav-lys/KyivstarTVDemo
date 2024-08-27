//
//  NetworkPlugin.swift
//  NetworkLayer
//
//  Created by Vladyslav Lysenko on 27.08.2024.
//

import Foundation

public protocol NetworkPlugin {
    func prepare(_ request: URLRequest, target: RequestConvertible) throws -> URLRequest
    func process(_ result: Network.ResponseResult, target: RequestConvertible) -> Network.ResponseResult
    func should(
        target: RequestConvertible,
        dueTo error: Error,
        completion: @escaping (Network.RetryResult) -> Void
    )
}

extension NetworkPlugin {
    public func prepare(_ request: URLRequest, target: RequestConvertible) -> URLRequest {
        request
    }

    public func process(_ result: Network.ResponseResult, target: RequestConvertible) -> Network.ResponseResult {
        result
    }

    public func should(
        target: RequestConvertible,
        dueTo error: Error,
        completion: @escaping (Network.RetryResult) -> Void
    ) {
        completion(.doNotRetry)
    }
}
