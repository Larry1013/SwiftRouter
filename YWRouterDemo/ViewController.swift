//
//  ViewController.swift
//  YWRouterDemo
//
//  Created by 賴弋威 on 2019/1/15.
//  Copyright © 2019 賴弋威. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showFirst(_ sender: Any) {
        self.ywAction.showFirst(current: self, title: "First!!")
    }
    
    @IBAction func showSecond(_ sender: Any) {
        self.ywAction.showFirst(current: self, title: "Second!!")
    }
    
    @IBAction func showThird(_ sender: Any) {
        self.ywAction.showFirst(current: self, title: "Third!!")
    }
    
}

class FirstController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var titleStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = titleStr
        // Do any additional setup after loading the view, typically from a nib.
    }
}

class SecondController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var titleStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.label.text = titleStr
        // Do any additional setup after loading the view, typically from a nib.
    }
}

class ThirdController: UIViewController {
    var titleStr: String? = ""
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.label.text = titleStr
        // Do any additional setup after loading the view, typically from a nib.
    }
}


extension FirstController: YWRoutable {
    static func initWithParameter(dataProvider: BaseViewControllerDataProvider?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstController") as? FirstController else {
            return UIViewController()
        }
        if let info = dataProvider?.parameter {
            if let title = info["Title"] as? String {
                vc.titleStr = title
            }
        }
        return vc
    }
}

extension SecondController: YWRoutable {
    static func initWithParameter(dataProvider: BaseViewControllerDataProvider?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondController") as? SecondController else {
            return UIViewController()
        }
        if let info = dataProvider?.parameter {
            vc.titleStr =  (info["Title"] as? String)!
        }
        return vc
    }
}

extension ThirdController: YWRoutable {
    static func initWithParameter(dataProvider: BaseViewControllerDataProvider?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdController") as? ThirdController else {
            return UIViewController()
        }
        if let info = dataProvider?.parameter {
            vc.titleStr = info["Title"] as? String
        }
        return vc
    }
}

extension YWAction where T: BaseViewController {
    func showFirst(current: UIViewController?, title: String) {
        YWRouter.open(current: current, path: YWViewRouterAction.firstPage( title: title))
    }
    func showSecond(current: UIViewController?, title: String) {
        YWRouter.open(current: current, path: YWViewRouterAction.secondPage(title: title))
    }
    func showThird(current: UIViewController?, title: String) {
        YWRouter.open(current: current, path: YWViewRouterAction.thirdPage(title: title))
    }
}
