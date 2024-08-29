//
//  PromotionView.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 29.08.2024.
//

import UIKit
import Nuke

final class PromotionView: UIView {
    // MARK: - Constants
    private enum C {
        static let pageControlBottomPadding: CGFloat = 8
        static let pageControlWidth: CGFloat = 130
        static let pageControlHeight: CGFloat = 6
    }
    
    // MARK: - Views
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var pageControl: UIPageControl = {
        var pageControl = UIPageControl()
        pageControl.backgroundStyle = .minimal
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    // MARK: - Private Properties
    private var promotions: [Promotion] = []
    
    // MARK: - Public Properties
    var currentPage: Int = .zero {
        didSet {
            switchToStep(currentPage)
        }
    }
    
    // MARK: - Iniitialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupGestures()
        setupPageControl()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Configure
    func configure(promotions: [Promotion]) {
        self.promotions = promotions
        pageControl.numberOfPages = promotions.count
        pageControl.size(forNumberOfPages: 1)
        currentPage = .zero
    }
    
    // MARK: - Setup
    private func setupImageView() {
        addSubview(imageView)
        
        with(imageView) {
            $0.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        }
    }
    
    private func setupPageControl() {
        addSubview(pageControl)
        
        with(pageControl) {
            $0.centerXAnchor.constraint(equalTo: centerXAnchor, constant: .zero).isActive = true
            $0.heightAnchor.constraint(equalToConstant: C.pageControlHeight).isActive = true
            $0.widthAnchor.constraint(equalToConstant: C.pageControlWidth).isActive = true
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -C.pageControlBottomPadding).isActive = true
        }
    }
    
    private func setupGestures() {
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        leftSwipeGesture.direction = .left
        addGestureRecognizer(leftSwipeGesture)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        rightSwipeGesture.direction = .right
        addGestureRecognizer(rightSwipeGesture)
    }
    
    // MARK: - Private Methods
    private func switchToStep(_ step: Int) {
        guard !promotions.isEmpty, step < promotions.count && step >= 0 else { return }
        pageControl.currentPage = step
        loadImage(from: promotions[pageControl.currentPage].image)
    }
    
    private func loadImage(from url: URL) {
        ImagePipeline.shared.loadImage(with: url) { [weak self] in
            guard let self, case .success(let response) = $0 else { return }
            self.imageView.image = response.image
        }
    }
    
    // MARK: - Actions
    @objc private func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left: switchToStep(pageControl.currentPage + 1)
        case .right: switchToStep(pageControl.currentPage - 1)
        default: break
        }
    }
}
