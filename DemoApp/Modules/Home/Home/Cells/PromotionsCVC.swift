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
    }
    
    // MARK: - Views
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame = bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.layer.cornerRadius = C.cornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Properties
    private var promotions: [Promotion] = []
    
    // MARK: - Life cycles
    override func prepareForReuse() {
        super.prepareForReuse()
        setupImageView()
    }
    
    // MARK: - Setup
    private func setupImageView() {
        addSubview(imageView)
    }
    
    // MARK: - Configure
    func configure(group: PromotionGroup) {
        guard !group.promotions.isEmpty, let first = promotions.first else { return }
        promotions = group.promotions
        
        ImagePipeline.shared.loadImage(with: first.image) { [weak self] in
            guard let self, case .success(let response) = $0 else { return }
            self.imageView.image = response.image
        }
    }
}
