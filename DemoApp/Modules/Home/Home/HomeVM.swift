//
//  HomeVM.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 28.08.2024.
//

import Combine

final class HomeVM: BaseVM, UseCasesConsumer {
    typealias UseCases = HasAssetsUseCases
    
    // MARK: - Properties
    @Published var promotionGroup: PromotionGroup?
    
    // MARK: - Initialize
    init(useCases: UseCases) {
        super.init()
        self.useCases = useCases
    }
    
    // MARK: - Actions
    func getPromotions() {
        useCases.assets
            .getPromotionGroup()
            .assignTo(isLoading: \.isLoading, value: \.promotionGroup, error: \.error, on: self)
            .store(in: &subscriptions)
    }
}
