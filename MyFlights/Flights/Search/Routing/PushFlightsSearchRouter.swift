import UIKit

class PushFlightsSearchRouter: FlightsSearchRouter {
    var rootViewController: UIViewController?
    private let detailScreenFactory: UIKitFlightDetailViewControllerFactory
    
    init(detailScreenFactory: UIKitFlightDetailViewControllerFactory) {
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
