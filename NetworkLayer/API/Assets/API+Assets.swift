//
//  API+Assets.swift
//  NetworkLayer
//
//  Created by Vladyslav Lysenko on 27.08.2024.
//

import Foundation

extension API {
    public enum Assets: RequestConvertible {
        case getPromotions
        case getCategories
        case getContentGroups
        case getAssetDetails
        
        var path: String {
            switch self {
            case .getPromotions: "j_BRMrbcY-5W"
            case .getCategories: "eO-fawoGqaNB"
            case .getContentGroups: "PGgg02gplft-"
            case .getAssetDetails: "04Pl5AYhO6-n"
            }
        }
        
        var method: Network.Method { .get }
        
        var task: Network.Task { .requestPlain }
        
        var suffix: String { "/data" }
    }
}
