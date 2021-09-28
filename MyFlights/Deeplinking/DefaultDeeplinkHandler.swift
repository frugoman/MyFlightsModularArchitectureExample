import UIKit
import Deeplinking

class DefaultDeeplinkHandler: DeeplinkHandler {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func canHandle(url: Deeplink) -> Bool {
        return true
    }
    
    func handle(url: Deeplink) {
        navigationController.pushViewController(UIViewController(), animated: true)
    }
}
