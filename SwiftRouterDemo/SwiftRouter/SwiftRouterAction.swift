//
//  SwiftRouterAction.swift
//  YWRouterDemo
//
//  Created by 賴弋威 on 2019/8/8.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import Foundation
import UIKit
enum SwiftViewRouterAction: SwiftRouterPathable {
    //透過enum定義所有跟Web有關的行為以及需要的參數
    case firstPage(title: String)
    case secondPage(title: String)
    case thirdPage(title: String)
    var viewcontroller: UIViewController.Type {
        // 將各個case與ViewController做連結 在open時需要使用
        switch self {
        case .firstPage:
            return FirstController.self
        case .secondPage:
            return SecondController.self
        case .thirdPage:
            return ThirdController.self
        }
    }
}
