//
//  AssetsService.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 27.08.2024.
//

import NetworkLayer
import Combine

final class AssetsService: AssetsUseCases {
    // MARK: - Private Properties
    private let network: Network
    
    // MARK: - Initialize
    init(network: Network) {
        self.network = network
    }
    
    // MARK: - Use Cases
    func getPromotionGroup() -> AsyncTask<PromotionGroup> {
        network.request(API.Assets.getPromotions)
            .decode(PromotionGroup.Response.self)
            .mapToAppError()
            .map { PromotionGroup($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
