# TabBarController

<div align="leading">
    <a href="https://developer.apple.com/swift">
        <img src="https://img.shields.io/badge/language-Swift_5-green" alt="Swift5" />
    </a>
    <a href="https://github.com/MobileUpLLC/TabBarController" >
        <img src="https://img.shields.io/badge/iOS-15.0+-orange?style=flat"/>
    </a>
    <a href="https://github.com/MobileUpLLC/TabBarController" >
        <img src="https://img.shields.io/badge/SPM-compatible-orange?style=flat"/>
    </a>
    <a href="https://github.com/MobileUpLLC/TabBarController/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-green" alt="License: MIT" />
    </a>
</div>
<br>

Fully customizable tabbar controller.

## Features
* Cusom tabbar view. No limitations.
* Standart `UIViewController` lifecycle for child controllers.
* Preserve child controllers across selection.
* Hide/Show tabbar view.
* Cocoa-like API. UIKit support.

## Usage

1. Create custom tabbar view
```swift
class MyTabBarView: UIView { 
    // Should be called on every selected tab change.
    var onItemSelect: (Int) -> Void

    // Current selected tab index.
    var selectedIndex: Int

    // Layout tab bar view items.
}
```
**Note:** Above provided one of possible API. You are not limited to use delegate or other patterns.

2. Create custom tabbar controller
```swift
import TabBarController

class MyTabBarController: TabBarController {
    // Provide your root controllers.
    override var controllers: [UIViewController] { myChildControllers }

    // Provide your tabbar view.
    override var tabBarView: UIView { myTabBarView }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myTabBarView)
        // Add contraints for tabbar view or layout it other way.

        // Show corresponding child controller on tabbar view selection change.
        myTabBarView.onItemSelect = { [weak self] selectedIndex in
            self?.selectedIndex = seelctedIndex
        }
    }

    // Update tabbar view state on programmatically selected tab chage.
    override func selectedIndexDidChange() {
        super.selectedIndexDidChange()

        myTabBarView.selectedIndex = selectedIndex
    }
}
```

3. Use `MyTabBarController` as default tabbar controller.
```swift
let controller = MyTabBarController()
controller.myChildControllers = [...]

window?.rootViewContoller = controller
```

4. *(Optional, but handy)* To make `MyTabBarContoller` accessible from every `UIViewController` just like default `UITabBarController`:
```swift
extension UIViewController {
    var myTabBarController: MyTabBarController? {
        findParent(type: MyTabBarController.self)
    }
}
```
So from any view controller:
```swift
myTabBarController.setTabBarVisibility(isHidden: true)
```

## Implementation Details
The implementation is super lightweight. `TabBarController` inherits `UIViewController` and doesn't use `UITabBarController` under the hood.

## Requirements
- Swift 5.0
- iOS 15.0

## Installation
### SPM

```swift
dependencies: [
    .package(
        url: "https://github.com/MobileUpLLC/TabBarController",
        .upToNextMajor(from: "1.0.0")
    )
]
```

## License
TabBarController is destributed under the [MIT license](https://github.com/MobileUpLLC/TabBarController/blob/main/LICENSE).
