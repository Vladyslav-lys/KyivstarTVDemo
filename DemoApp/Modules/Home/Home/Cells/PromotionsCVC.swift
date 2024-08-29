//
//  PromotionsCVC.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 28.08.2024.
//

import UIKit
import Nuke

final class PromotionsCVC: UICollectionViewCell {
    // MARK: - Constants
    private enum C {
        static let horizontalPadding: CGFloat = 24
    }
    
    // MARK: - Views
    private lazy var promotionView: PromotionView = {
        var view = PromotionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Constants.cornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: - Life cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPromotionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup
    private func setupPromotionView() {
        contentView.addSubview(promotionView)
        
        with(promotionView) {
            $0.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: .zero).isActive = true
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: C.horizontalPadding).isActive = true
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -C.horizontalPadding).isActive = true
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero).isActive = true
        }
    }
    
    // MARK: - Configure
    func configure(group: PromotionGroup) {
        guard !group.promotions.isEmpty else { return }
        promotionView.configure(promotions: group.promotions)
    }
}
