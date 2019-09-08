//
//  SwiftRouter.swift
//  SwiftRouterDemo
//
//  Created by 賴弋威 on 2019/1/15.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import Foundation
import UIKit
class SwiftRouter {
    static let shared = SwiftRouter()
    var currentNav: UINavigationController?
    private var currentWindow: UIWindow?
    open class func createNavWith(vc: UIViewController, window: UIWindow) {
        let router = SwiftRouter.shared
        let nav = UINavigationController()
        nav.viewControllers = [vc]
        window.rootViewController = nav
        window.makeKeyAndVisible()
        router.currentNav = nav
        router.currentWindow = window
    }
    open class func open(current: UIViewController?, path: SwiftRouterPathable, present: Bool = false, animated: Bool = true, presentComplete: (() -> Void)? = nil) {
        let action = path.viewcontroller
        var vc: UIViewController?
        vc = action.initWith(action: path)
        guard let currentVC = vc else {
            return
        }
        if present {
            current?.present(currentVC, animated: animated, completion: presentComplete)
        } else {
            if let nav = SwiftRouter.shared.currentNav {
                nav.pushViewController(currentVC, animated: animated)
            }
        }
    }
}
