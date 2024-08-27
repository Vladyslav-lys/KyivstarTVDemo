//
//  Promotion.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 27.08.2024.
//

import Foundation

struct Promotion: Identifiable {
    let id: String
    let name: String
    let image: URL
    let company: String
    let updatedAt: Date
    let releaseDate: Date
}
