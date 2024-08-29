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
        static let lockImageSide: CGFloat = 24
        static let lockImageSpacing: CGFloat = 8
    }
    
    // MARK: - Views
    private lazy var assetImageView: UIImageView = {
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
    
    private lazy var lockImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = R.image.icLock()!
        imageView.isHidden = true
        return imageView
    }()
    
    // MARK: - Life cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAssetImageView()
        setupLockImageView()
        setupNameLabel()
        setupProgressView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Configure
    func configure(asset: Asset) {
        nameLabel.text = asset.name
        lockImageView.isHidden = asset.purchased
        progressView.progress = Float(asset.progress) / 100
        loadImage(url: asset.image)
    }
    
    // MARK: - Setup
    private func setupAssetImageView() {
        addSubview(assetImageView)
        
        NSLayoutConstraint.activate([
            assetImageView.widthAnchor.constraint(equalToConstant: C.imageWidth),
            assetImageView.heightAnchor.constraint(equalToConstant: C.imageHeight),
            assetImageView.topAnchor.constraint(equalTo: topAnchor, constant: .zero),
            assetImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero),
            assetImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero)
        ])
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: assetImageView.bottomAnchor, constant: Constants.labelImageSpacing),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero)
        ])
    }
    
    private func setupProgressView() {
        assetImageView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: C.progressHeight),
            progressView.leadingAnchor.constraint(equalTo: assetImageView.leadingAnchor, constant: .zero),
            progressView.trailingAnchor.constraint(equalTo: assetImageView.trailingAnchor, constant: .zero),
            progressView.bottomAnchor.constraint(equalTo: assetImageView.bottomAnchor, constant: .zero)
        ])
    }
    
    private func setupLockImageView() {
        assetImageView.addSubview(lockImageView)
        
        NSLayoutConstraint.activate([
            lockImageView.widthAnchor.constraint(equalToConstant: C.lockImageSide),
            lockImageView.heightAnchor.constraint(equalToConstant: C.lockImageSide),
            lockImageView.leadingAnchor.constraint(equalTo: assetImageView.leadingAnchor, constant: C.lockImageSpacing),
            lockImageView.topAnchor.constraint(equalTo: assetImageView.topAnchor, constant: C.lockImageSpacing)
        ])
    }
    
    // MARK: - Private Methods
    private func loadImage(url: URL) {
        ImagePipeline.shared.loadImage(with: url) { [weak self] in
            guard let self, case .success(let response) = $0 else { return }
            self.assetImageView.image = response.image
        }
    }
}
