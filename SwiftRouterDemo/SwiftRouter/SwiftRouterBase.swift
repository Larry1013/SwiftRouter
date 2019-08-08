//
//  SwiftRouterBase.swift
//  YWRouterDemo
//
//  Created by 賴弋威 on 2019/8/8.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import Foundation
import UIKit
public struct SwiftAction<T> {
    public let base: T
    public init(_ base: T) {
        self.base = base
    }
}

public protocol SwiftActionProtocol {
    associatedtype CompatibleType
    var action: SwiftAction<CompatibleType> { get }
}

extension SwiftActionProtocol {
    public var action: SwiftAction<Self> {
        get {
            return SwiftAction(self)
        }
    }
}
extension UIViewController: SwiftActionProtocol{}
