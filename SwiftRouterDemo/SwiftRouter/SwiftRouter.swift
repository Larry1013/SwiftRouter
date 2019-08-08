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
    open class func open(current: UIViewController?, path: SwiftRouterPathable, present: Bool = false, animated: Bool = true, presentComplete: (() -> Void)? = nil) {
        guard let action = path.viewcontroller as? SwiftRoutable.Type else {
            return
        }
        var vc: UIViewController?
        vc = action.initWith(action: path)
        guard let currentVC = vc else {
            return
        }
        if present {
            current?.present(currentVC, animated: animated, completion: presentComplete)
        } else {
            if let nav = current?.navigationController {
                nav.pushViewController(currentVC, animated: animated)
            }
        }
    }
}
