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
    private var navigationImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = R.image.icHomeTitle()!
        return imageView
    }()
    
    // MARK: - Properties
    var viewModel: HomeVM?
    
    // MARK: - Life cycles
    override func setupVC() {
        super.setupVC()
        navigationItem.titleView = navigationImageView
    }
}

