//
//  AppCoordinator.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 26.08.2024.
//

import UIKit

final class AppCoordinator {
    // MARK: - Public Properties
    let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    // MARK: - Initialize
    init() {
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }
}
