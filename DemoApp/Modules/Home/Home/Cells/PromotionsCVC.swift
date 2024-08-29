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
        static let cornerRadius: CGFloat = 16
        static let horizontalPadding: CGFloat = 24
    }
    
    // MARK: - Views
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = C.cornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Properties
    private var promotions: [Promotion] = []
    
    // MARK: - Life cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        with(imageView) {
            $0.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: .zero).isActive = true
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: C.horizontalPadding).isActive = true
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -C.horizontalPadding).isActive = true
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero).isActive = true
        }
    }
    
    // MARK: - Configure
    func configure(group: PromotionGroup) {
        guard !group.promotions.isEmpty, let first = group.promotions.first else { return }
        promotions = group.promotions
        
        ImagePipeline.shared.loadImage(with: first.image) { [weak self] in
            guard let self, case .success(let response) = $0 else { return }
            self.imageView.image = response.image
        }
    }
}
