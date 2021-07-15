import UIKit

protocol FlightDetailViewControllerFactory {
    func viewController(withFlightId flightId: String) -> UIViewController
}
