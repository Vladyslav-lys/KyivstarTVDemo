//
//  HomeVC+DataSource.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 28.08.2024.
//

import UIKit

extension HomeVC {
    // MARK: - Typealias
    typealias Content = (section: Section, items: [Item])
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    // MARK: - Enums
    enum Section: Int {
        case promotions
        case categories
        
        var name: String? {
            switch self {
            case .categories: "Категорії"
            default: nil
            }
        }
    }

    enum Item: Equatable, Hashable {
        case promotions(group: PromotionGroup)
        case categories(category: Category)
    }
    
    // MARK: - Methods
    func makeDataSource(collectionView: UICollectionView) -> DataSource {
        DataSource(collectionView: collectionView) { collectionView, indexPath, config in
            switch config {
            case .promotions(let group):
                collectionView.makeCell(PromotionsCVC.self, for: indexPath) {
                    $0.configure(group: group)
                }
            case .categories(let category):
                collectionView.makeCell(CategoryCVC.self, for: indexPath) {
                    $0.configure(category: category)
                }
            }
        }
    }
    
    func makeSnapshot(from promotionGroup: PromotionGroup, content: [Content]) -> Snapshot {
        with(Snapshot()) { snapshot in
            if !promotionGroup.promotions.isEmpty {
                snapshot.appendSections([.promotions])
                snapshot.appendItems([.promotions(group: promotionGroup)])
            }
            
            content.forEach {
                snapshot.appendSections([$0.section])
                snapshot.appendItems($0.items, toSection: $0.section)
            }
        }
    }
}
