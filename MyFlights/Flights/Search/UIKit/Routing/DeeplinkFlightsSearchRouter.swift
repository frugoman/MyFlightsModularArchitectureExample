import UIKit
import MyFlightsDeeplinking

class DeeplinkFlightsSearchRouter: FlightsSearchRouter {
    private let application: UIApplication
    private let registry: DeeplinkRegistry
    var rootViewController: UIViewController?
    
    init(application: UIApplication, registry: DeeplinkRegistry) {
        self.application = application
        self.registry = registry
    }
    
    func routeToDetails(_ flightId: String) {
        guard
            let rootViewController = rootViewController,
            let url = URL(string: "myFlights://flights/detail?id=\(flightId)"),
            let destination = registry.getScreen(forPath: url)
        else { return } // Maybe root to home screen
        rootViewController.present(destination, animated: true, completion: nil)
    }
}
