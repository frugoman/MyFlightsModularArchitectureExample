import UIKit
import Deeplinking
import WhatsNew

class DeeplinkBootstrapConfigurator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configureDeeplinks(registry: DeeplinkRegistry) {
        let handlers: [DeeplinkHandler] = [
            DetailsDeeplinkHandler(
                factory: UIKitFlightDetailViewControllerFactory(),
                navigationController: navigationController
            ),
            AppNewsDeeplinkHandlerTrackingDecorator(
                decoratee: AppNewsDeeplinkHandler(
                    deeplinkRegistry: registry,
                    rootViewController: navigationController
                )
            )
        ]
        
        handlers.forEach(registry.register(deeplinkHandler:))
    }
}
