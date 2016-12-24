import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  lazy var viewController: ViewController = ViewController()
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
      return UIStatusBarStyle.lightContent
    }
    
    return true
  }
  
}

