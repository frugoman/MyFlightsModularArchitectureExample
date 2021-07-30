import UIKit
import MyFlightsDeeplinking
import WhatsNew

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var deeplinkRegistry: DeeplinkRegistry?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController(
            rootViewController: UIKitFlightsSearchViewControllerFactory(
                onFlightSelected: { [weak self] id in self?.deeplinkRegistry?.execute(url: .orDefaultDeeplink("myFlights://flights/detail?id=\(id)"))
                }
            ).viewController()
        )
        let deeplinkRegistry = DeeplinkRegistry(
            defaultDeeplinkHandler: DefaultDeeplinkHandler(
                navigationController: navigationController
            )
        )
        DeeplinkBootstrapConfigurator(navigationController: navigationController)
            .configureDeeplinks(registry: deeplinkRegistry)
        
        self.deeplinkRegistry = deeplinkRegistry
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        
        WhatsNewService().getWhatsNew { news in
            deeplinkRegistry.execute(url: .orDefaultDeeplink("myFlights://flights/whats_new?title=\(news.title)&message=\(news.message)&action=\(news.action)"))
        }
    }
}
