//
//  SwiftRouterProtocol.swift
//  YWRouterDemo
//
//  Created by 賴弋威 on 2019/8/8.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import Foundation
import UIKit
protocol SwiftRouterPathable {
    var viewcontroller: UIViewController.Type { get } // 定義有哪些VC要使用Router
}
protocol BaseViewControllerDataProvider {}
protocol SwiftRoutable {
    //通過RouterPathable中的params來init並塞值
    var action: SwiftViewRouterAction? { get set }
    static func initWith(action: SwiftViewRouterAction?) -> UIViewController
    func setupWith(_ path: SwiftViewRouterAction?)
}
