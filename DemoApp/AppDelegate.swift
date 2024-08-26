//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Pete Shpagin on 31.03.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public Properties
    var window: UIWindow?
    
    // MARK: - Private Properties
    private lazy var appCoordinator = AppCoordinator()
    
    // MARK: - Methods
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = appCoordinator.window
        return true
    }
}

