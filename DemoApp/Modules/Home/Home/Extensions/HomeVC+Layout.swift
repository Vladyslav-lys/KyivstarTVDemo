//
//  HomeVC+Layout.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 28.08.2024.
//

import UIKit

extension HomeVC {
    // MARK: - Constants
    private enum C {
        static let promotionSectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(180))
    }
    
    // MARK: - Public Methods
    func makeLayout(dataSource: DataSource) -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout(sectionProvider: { [weak self, weak dataSource] index, _ in
            switch dataSource?.snapshot().sectionIdentifiers[index] {
            case .promotions: self?.makePromotionLayoutSection()
            default: nil
            }
        })
    }
    
    // MARK: - Private Methods
    private func makePromotionLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: C.promotionSectionSize)
        return NSCollectionLayoutSection(group: .vertical(layoutSize: C.promotionSectionSize, subitems: [item]))
    }
}
