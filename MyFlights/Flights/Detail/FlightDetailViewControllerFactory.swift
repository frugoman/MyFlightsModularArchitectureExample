import UIKit
import FlightsSearchPresentation
import MyFlightsSearchEngine

protocol FlightDetailViewControllerFactory {
    func viewController(withFlightId flightId: String) -> UIViewController
}

class UIKitFlightDetailViewControllerFactory: FlightDetailViewControllerFactory {
    func viewController(withFlightId flightId: String) -> UIViewController {
        let presenter = FlightDetailPresenter()
        let dataSource = LocalWithFallbacksFlightsDataSource(
            local: InMemoryFlightsDataSource(),
            fallback: RemoteFlightsDataSource()
        )
        let getById = GetFlightById(output: presenter, datasource: dataSource)
        let composer = FlightDetailViewControllerDelegateComposer()
        composer.onLoad = [
             getById.getFlight(byId:),
            FirebaseFlightDetailViewControllerDelegateTracker().viewDidLoad(withId:),
            CustomServiceFlightDetailViewControllerDelegateTracker().viewDidLoad(withId:)
        ]
        let vc = FlightDetailViewController(flightId: flightId, delegate: composer)
        presenter.view = vc
        return vc
    }
}
