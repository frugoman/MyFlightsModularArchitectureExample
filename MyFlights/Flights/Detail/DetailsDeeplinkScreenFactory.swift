import UIKit
import MyFlightsDeeplinking

class DetailsDeeplinkScreenFactory: DeeplinkScreenFactory {
    private let factory: FlightDetailViewControllerFactory
    
    init(factory: FlightDetailViewControllerFactory) {
        self.factory = factory
    }
    
    func screen(forPath path: URL) -> UIViewController? {
        // Validate path somehow
        guard let flightId = path.value(forQuearyParam: "id") else {
            return nil
        }
        return factory.viewController(withFlightId: flightId)
    }
}
