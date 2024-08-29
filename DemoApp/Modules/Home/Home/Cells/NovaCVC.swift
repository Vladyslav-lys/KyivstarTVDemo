//
//  MoviesAndSeriesCVC.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 29.08.2024.
//

import UIKit
import Nuke

final class NovaCVC: UICollectionViewCell {
    // MARK: - Constants
    private enum C {
        static let imageHeight: CGFloat = 156
        static let imageWidth: CGFloat = 104
        static let cornerRadius: CGFloat = 12
        static let progressHeight: CGFloat = 4
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
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.font = Constants.nameFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        var progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .clear
        progressView.progressTintColor = R.color.navy()!
        return progressView
    }()
    
    // MARK: - Life cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupNameLabel()
        setupProgressView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Configure
    func configure(asset: Asset) {
        nameLabel.text = asset.name
        progressView.progress = Float(asset.progress) / 100
        loadImage(url: asset.image)
    }
    
    // MARK: - Setup
    private func setupImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: C.imageWidth),
            imageView.heightAnchor.constraint(equalToConstant: C.imageHeight),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: .zero),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero)
        ])
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.labelImageSpacing),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero)
        ])
    }
    
    private func setupProgressView() {
        imageView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: C.progressHeight),
            progressView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: .zero),
            progressView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: .zero),
            progressView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: .zero)
        ])
    }
    
    // MARK: - Private Methods
    private func loadImage(url: URL) {
        ImagePipeline.shared.loadImage(with: url) { [weak self] in
            guard let self, case .success(let response) = $0 else { return }
            self.imageView.image = response.image
        }
    }
}
