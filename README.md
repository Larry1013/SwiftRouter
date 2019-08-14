# SwiftRouter

SwiftRouter is a router to decouple viewControlllers

## Installation

Downloading and put it to your Swift Project


## Usage

```swift
//1. make your viewController routable
extension YourController: SwiftRoutable {
    func setupWithPath() {
        guard let path = path else {
            return
        }
        path.actionBlock?(self)
    }
    static func initWith(action: SwiftRouterPathable?) -> UIViewController {
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "YourController") as? YourController else {
            return UIViewController()
        }
        vc.path = action
        return vc
    }
}
//2. create your routerPath
enum YourVCType: SwiftRouterPathable {
    var viewcontroller: SwiftRoutable.Type {
        return YourController.self
    }
    var actionBlock: ActionBlock? {
        switch self {
        case .normal(let title):
            return {(vc) in
                if let vc = vc as? YourController {
                    vc.label.text = title
                }
            }
        }
    }
    case normal(title: String)
}
//3. make sure your viewController call setupWithPath when ViewDidLoad
class YourController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var path: SwiftRouterPathable?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWithPath()
    }
}
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
