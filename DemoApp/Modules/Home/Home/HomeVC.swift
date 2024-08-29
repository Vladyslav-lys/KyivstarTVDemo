//
//  ViewController.swift
//  DemoApp
//
//  Created by Pete Shpagin on 31.03.2021.
//

import UIKit

extension HomeVC: Makeable {
    static func make() -> HomeVC { HomeVC() }
}

final class HomeVC: BaseVC, ViewModelContainer {
    // MARK: - Views
    private lazy var navigationImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = R.image.icHomeTitle()!
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: .init())
        collectionView.register(PromotionsCVC.self)
        return collectionView
    }()
    
    // MARK: - Public Properties
    var viewModel: HomeVM?
    
    // MARK: - Private Properties
    private lazy var dataSource = makeDataSource(collectionView: collectionView)
    
    // MARK: - Life cycles
    override func bind() {
        super.bind()
        setupViewModel()
        
        viewModel?.$promotionGroup
            .sink { [weak self] promotionGroup in
                guard let self, let promotionGroup else { return }
                let snapshot = self.makeSnapshot(from: promotionGroup, content: []) // TODO: - Other content will be later
                self.dataSource.apply(snapshot)
            }
            .store(in: &subscriptions)
    }
    
    override func setupVC() {
        super.setupVC()
        setupNavigationBarTitle()
        setupCollectionView()
    }
    
    // MARK: - Setup
    private func setupNavigationBarTitle() {
        navigationItem.titleView = navigationImageView
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        with(collectionView) {
            $0.collectionViewLayout = makeLayout(dataSource: dataSource)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .zero).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .zero).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: .zero).isActive = true
        }
    }
}

