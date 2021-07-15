import UIKit

final class InitialControllerFactory {
    
    func makeInitialController() -> UIViewController {
        UIKitFlightsSearchViewControllerFactory().viewController()
    }
}
