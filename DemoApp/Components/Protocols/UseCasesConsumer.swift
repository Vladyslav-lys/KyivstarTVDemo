//
//  UseCasesConsumer.swift
//  DemoApp
//
//  Created by Vladyslav Lysenko on 28.08.2024.
//

import Foundation

protocol UseCasesConsumer: AnyObject {
    associatedtype UseCases
    
    var useCases: UseCases { get }
}

private enum UseCasesConsumerKeys {
    static var useCases = "useCases"
}

extension UseCasesConsumer {
    var useCases: UseCases {
        get {
            if let useCases: UseCases = ObjcRuntime.getAssociatedObject(
                object: self,
                key: &UseCasesConsumerKeys.useCases
            ) {
                return useCases
            } else {
                fatalError("useCases are required for \(Self.self)")
            }
        }
        
        set {
            ObjcRuntime.setAssociatedObject(
                object: self,
                value: newValue,
                key: &UseCasesConsumerKeys.useCases,
                policy: .retain
            )
        }
    }
}
