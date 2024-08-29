//
//  AssetGroup.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 29.08.2024.
//

import Foundation

struct AssetGroup: Identifiable {
    let id: String
    let name: String
    let type: [ContentType]
    let assets: [Asset]
}

extension AssetGroup {
    enum ContentType: String, Decodable {
        case epg = "EPG"
        case livechannel = "LIVECHANNEL"
        case moview = "MOVIE"
        case series = "SERIES"
    }
}
