import UIKit
import Deeplinking
import WhatsNew

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var deeplinkRegistry: DeeplinkRegistry?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: scene)
        
        let navigationController = rootViewController()
        let deeplinkRegistry = DeeplinkRegistry(
            defaultDeeplinkHandler: DefaultDeeplinkHandler(
                navigationController: navigationController
            )
        )
        DeeplinkBootstrapConfigurator(navigationController: navigationController)
            .configureDeeplinks(registry: deeplinkRegistry)
        
        window.rootViewController = navigationController
        self.deeplinkRegistry = deeplinkRegistry
        self.window = window
        window.makeKeyAndVisible()
        
        // Example of something triggering deeplinks
        WhatsNewExample(service: WhatsNewService()) { [weak self] news in
            if let dlRegistry = self?.deeplinkRegistry {
                WhatsNewRouter(deeplinkRegistry: dlRegistry).route(toNews: news)
            }
        }.fetch()
    }
    
    private func rootViewController() -> UINavigationController {
        UINavigationController(
            rootViewController: UIKitFlightsSearchViewControllerFactory(
                detailsScreenFactory: UIKitFlightDetailViewControllerFactory()
            ).viewController()
        )
    }
}
