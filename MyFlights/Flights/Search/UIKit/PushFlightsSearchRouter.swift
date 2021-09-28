import UIKit

class PushFlightsSearchRouter {
    var rootViewController: UIViewController?
    private let detailScreenFactory: FlightDetailViewControllerFactory
    
    init(detailScreenFactory: FlightDetailViewControllerFactory) {
        self.detailScreenFactory = detailScreenFactory
    }
    
    func routeToDetails(_ flightId: String) {
        guard let rootViewController = rootViewController else {
            return
        }
        let destinationVc = detailScreenFactory.viewController(withFlightId: flightId)
        rootViewController.present(destinationVc, animated: true, completion: nil)
    }
}
