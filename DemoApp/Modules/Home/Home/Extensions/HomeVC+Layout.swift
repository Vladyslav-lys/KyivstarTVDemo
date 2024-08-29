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
        static let promotionSectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180))
        static let categorySectionSize = NSCollectionLayoutSize(widthDimension: .absolute(104), heightDimension: .absolute(128))
        static let sectionInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        static let headerInsets = UIEdgeInsets(top: -14, left: 0, bottom: -8, right: 0)
        static let groupSpacing: CGFloat = 8
    }
    
    // MARK: - Public Methods
    func makeLayout(dataSource: DataSource) -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout(sectionProvider: { [weak self, weak dataSource] index, _ in
            switch dataSource?.snapshot().sectionIdentifiers[index] {
            case .promotions: self?.makePromotionLayoutSection()
            case .categories: self?.makeCategoryLayoutSection()
            default: nil
            }
        })
    }
    
    // MARK: - Private Methods
    private func makePromotionLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: C.promotionSectionSize)
        return NSCollectionLayoutSection(group: .vertical(layoutSize: C.promotionSectionSize, subitems: [item]))
    }
    
    private func makeCategoryLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: C.categorySectionSize)
        let section = NSCollectionLayoutSection(group: .vertical(layoutSize: C.categorySectionSize, subitems: [item]))
        section.interGroupSpacing = C.groupSpacing
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(insets: C.sectionInsets)
        section.boundarySupplementaryItems = [makeHeader()]
        return section
    }
    
    private func makeHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(24))
        
        let item = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        item.contentInsets = NSDirectionalEdgeInsets(insets: C.headerInsets)
        return item
    }
}
