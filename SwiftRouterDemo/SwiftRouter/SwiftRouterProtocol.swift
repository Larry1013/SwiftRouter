//
//  SwiftRouterProtocol.swift
//  YWRouterDemo
//
//  Created by 賴弋威 on 2019/8/8.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import Foundation
import UIKit
typealias ActionBlock = (UIViewController) -> Void
protocol SwiftRouterPathable {
    var viewcontroller: SwiftRoutable.Type { get } // 定義有哪些VC要使用Router
    var actionBlock: ActionBlock? { get }
}
protocol SwiftRoutable {
    //通過RouterPathable中的params來init並塞值
    static func initWith(action: SwiftRouterPathable?) -> UIViewController
    var path: SwiftRouterPathable? { get set }
    func setupWithPath()
}
protocol Routerable {
    var path: SwiftRouterPathable { get }
}
