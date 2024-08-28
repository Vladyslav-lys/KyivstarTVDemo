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
    private var navigationImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = R.image.icHomeTitle()!
        return imageView
    }()
    
    var viewModel: HomeVM?
    
    override func setupVC() {
        super.setupVC()
        navigationItem.titleView = navigationImageView
    }
}

