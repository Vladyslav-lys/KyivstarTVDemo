//
//  PromotionGroup.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 27.08.2024.
//

import Foundation

struct PromotionGroup: Identifiable {
    let id: String
    let name: String
    let promotions: [Promotion]
}
