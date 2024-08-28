//
//  HomeFactory.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 28.08.2024.
//

import UIKit

protocol HomeFactoryProtocol: AnyObject {
    func makeHomeVC() -> HomeVC
}

final class HomeFactory: ModuleFactory, HomeFactoryProtocol {
    func makeHomeVC() -> HomeVC {
        // TODO: Implementatino will be later
        makeController { _ in }
    }
}
