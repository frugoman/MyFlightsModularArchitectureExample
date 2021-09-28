import UIKit
import Deeplinking

class DetailsDeeplinkHandler: DeeplinkHandler {
    private let factory: FlightDetailViewControllerFactory
    private let navigationController: UINavigationController
    
    init(factory: FlightDetailViewControllerFactory, navigationController: UINavigationController) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    func canHandle(url: Deeplink) -> Bool {
        url.pathIs("/detail") && url.contains(queryParam: "id")
    }
    
    func handle(url: Deeplink) {
        let flightId = url.queryItem("id")!
        let vc = factory.viewController(withFlightId: flightId)
        navigationController.pushViewController(vc, animated: true)
    }
}
