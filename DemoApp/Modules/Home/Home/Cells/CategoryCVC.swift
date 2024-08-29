//
//  CategoryCVC.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 29.08.2024.
//

import UIKit
import Nuke

final class CategoryCVC: UICollectionViewCell {
    // MARK: - Constants
    private enum C {
        static let imageSide: CGFloat = 104
    }
    
    // MARK: - Views
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.font = Constants.nameFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Life cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupNameLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Configure
    func configure(category: Category) {
        nameLabel.text = category.name
        loadImage(url: category.image)
    }
    
    // MARK: - Setup
    private func setupImageView() {
        addSubview(imageView)
        
        with(imageView) {
            $0.widthAnchor.constraint(equalToConstant: C.imageSide).isActive = true
            $0.heightAnchor.constraint(equalToConstant: C.imageSide).isActive = true
            $0.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
        }
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        
        with(nameLabel) {
            $0.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: .zero).isActive = true
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        }
    }
    
    // MARK: - Private Methods
    private func loadImage(url: URL) {
        ImagePipeline.shared.loadImage(with: url) { [weak self] in
            guard let self, case .success(let response) = $0 else { return }
            self.imageView.image = response.image
        }
    }
}
