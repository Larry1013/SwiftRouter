//
//  ViewController.swift
//  SwiftRouterRouterDemo
//
//  Created by 賴弋威 on 2019/1/15.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import UIKit
struct BaseDataProvider: BaseViewControllerDataProvider {
    var title: String?
    init(title: String) {
        self.title = title
    }
}
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    
}

class FirstController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var action: SwiftViewRouterAction?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWith(action)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

class SecondController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var action: SwiftViewRouterAction?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        setupWith(action)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

class ThirdController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var action: SwiftViewRouterAction?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        setupWith(action)
        // Do any additional setup after loading the view, typically from a nib.
    }
}


extension FirstController: SwiftRoutable {
    func setupWith(_ path: SwiftViewRouterAction?) {
        guard let action = path else {
            return
        }
        switch action {
        case .firstPage(let title):
            label.text = title
        default:
            break
        }
    }

    static func initWith(action: SwiftViewRouterAction?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstController") as? FirstController else {
            return UIViewController()
        }
        vc.action = action
        return vc
    }
}

extension SecondController: SwiftRoutable {
    func setupWith(_ path: SwiftViewRouterAction?) {
        guard let action = path else {
            return
        }
        switch action {
        case .secondPage(let title):
            label.text = title
        default:
            break
        }
    }

    static func initWith(action: SwiftViewRouterAction?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondController") as? SecondController else {
            return UIViewController()
        }
        vc.action = action
        return vc
    }
}

extension ThirdController: SwiftRoutable {
    func setupWith(_ path: SwiftViewRouterAction?) {
        guard let action = path else {
            return
        }
        switch action {
        case .thirdPage(let title):
            label.text = title
        default:
            break
        }
    }

    static func initWith(action: SwiftViewRouterAction?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdController") as? ThirdController else {
            return UIViewController()
        }
        vc.action = action
        return vc
    }
}

extension SwiftAction where T: BaseViewController {
    func showFirst(current: UIViewController?, title: String) {
        SwiftRouter.open(current: current, path: SwiftViewRouterAction.firstPage(title: "Larry"))
    }
    func showSecond(current: UIViewController?, title: String) {
        SwiftRouter.open(current: current, path: SwiftViewRouterAction.secondPage(title: "Larry2"))
    }
    func showThird(current: UIViewController?, title: String) {
        SwiftRouter.open(current: current, path: SwiftViewRouterAction.thirdPage(title:"Larry3"))
    }
}
