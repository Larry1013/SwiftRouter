//
//  ViewController.swift
//  SwiftRouterRouterDemo
//
//  Created by 賴弋威 on 2019/1/15.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SwiftRouter.createNavWith(vc: self, window: UIWindow(frame: UIScreen.main.bounds))
    }

    @IBAction func showFirst(_ sender: Any) {
        self.action.showFirst(current: self, title: "First!!")
    }
    
    @IBAction func showSecond(_ sender: Any) {
        self.action.showSecond(current: self, title: "Second!!")
    }
    
    @IBAction func showThird(_ sender: Any) {
        self.action.showThird(current: self, title: "Third!!")
    }
    
    @IBAction func presentVc(_ sender: Any) {
        self.action.presentFirst(current: self, title: "pre看看")
    }
}

class FirstController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var path: SwiftRouterPathable?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWithPath()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
enum FirstVCType: SwiftRouterPathable {
    var viewcontroller: SwiftRoutable.Type {
        return FirstController.self
    }
    var actionBlock: ActionBlock? {
        switch self {
        case .normal(let title):
            return {(vc) in
                if let vc = vc as? FirstController {
                    vc.label.text = title
                }
            }
        }
    }

    case normal(title: String)
}
enum SecondVCType: SwiftRouterPathable {
    var viewcontroller: SwiftRoutable.Type {
        return SecondController.self
    }
    var actionBlock: ActionBlock? {
        switch self {
        case .normal(let title):
            return {(vc) in
                if let vc = vc as? SecondController {
                    vc.label.text = title
                }
            }
        }
    }
    case normal(title: String)
}
enum ThirdVCType: SwiftRouterPathable {
    var viewcontroller: SwiftRoutable.Type {
        return ThirdController.self
    }
    var actionBlock: ActionBlock? {
        switch self {
        case .normal(let title):
            return {(vc) in
                if let vc = vc as? ThirdController {
                    vc.label.text = title
                }
            }
        }
    }

    case normal(title: String)
}
class SecondController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var path: SwiftRouterPathable?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWithPath()
        self.view.backgroundColor = .green
        // Do any additional setup after loading the view, typically from a nib.
    }
}

class ThirdController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var path: SwiftRouterPathable?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWithPath()
        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view, typically from a nib.
    }
}


extension FirstController: SwiftRoutable {
    func setupWithPath() {
        guard let path = path else {
            return
        }
        path.actionBlock?(self)
    }

    static func initWith(action: SwiftRouterPathable?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstController") as? FirstController else {
            return UIViewController()
        }
        vc.path = action
        return vc
    }
}


extension SecondController: SwiftRoutable {
    func setupWithPath() {
        guard let path = path else {
            return
        }
        path.actionBlock?(self)
    }

    static func initWith(action: SwiftRouterPathable?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondController") as? SecondController else {
            return UIViewController()
        }
        vc.path = action
        return vc
    }
}

extension ThirdController: SwiftRoutable {
    func setupWithPath() {
        guard let path = path else {
            return
        }
        path.actionBlock?(self)
    }
    static func initWith(action: SwiftRouterPathable?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdController") as? ThirdController else {
            return UIViewController()
        }
        vc.path = action
        return vc
    }
}

extension SwiftAction where T: BaseViewController {
    func showFirst(current: UIViewController?, title: String) {
        SwiftRouter.open(current: current, path: FirstVCType.normal(title: title))
    }
    func showSecond(current: UIViewController?, title: String) {
        SwiftRouter.open(current: current, path: SecondVCType.normal(title: title))
    }
    func showThird(current: UIViewController?, title: String) {
        SwiftRouter.open(current: current, path: ThirdVCType.normal(title: title))
    }
    func presentFirst(current: UIViewController? ,title: String) {
        SwiftRouter.open(current: current, path: FirstVCType.normal(title: title), present: true, animated: true) {
            print("present成功")
        }
    }
}
