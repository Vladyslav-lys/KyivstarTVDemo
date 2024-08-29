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
    @Published var categoryGroup: CategoryGroup?
    
    // MARK: - Initialize
    init(useCases: UseCases) {
        super.init()
        self.useCases = useCases
        
        getData()
    }
    
    // MARK: - Actions
    private func getData() {
        getPromotions()
        getCategories()
    }
    
    private func getPromotions() {
        useCases.assets
            .getPromotionGroup()
            .assignTo(isLoading: \.isLoading, value: \.promotionGroup, error: \.error, on: self)
            .store(in: &subscriptions)
    }
    
    private func getCategories() {
        useCases.assets
            .getCategories()
            .assignTo(isLoading: \.isLoading, value: \.categoryGroup, error: \.error, on: self)
            .store(in: &subscriptions)
    }
}
