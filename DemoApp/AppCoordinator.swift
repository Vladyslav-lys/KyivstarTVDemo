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
    
    // MARK: - Private Properties
    private let useCases: UseCasesProvider
    
    // MARK: - Initialize
    init(useCases: UseCasesProvider) {
        self.useCases = useCases
        
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }
}
