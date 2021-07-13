import UIKit
import FlightsSearchPresentation
import MyFlightsSearchEngine

class UIKitFlightsSearchViewControllerFactory {
    func viewController() -> UIViewController {
        let presenter = FlightsSearchPresenter()
        let dataSource = LocalWithFallbacksFlightsDataSource(
            local: InMemoryFlightsDataSource(),
            fallback: RemoteFlightsDataSource()
        )
        let getAllFlights = GetFlightsForDestination(output: presenter, datasource: dataSource)
        let composer = FlightsSearchViewControllerComposer()
        let firebase = FirebaseFlightsSearchTracker()
        let customTracker = CustomServiceFlightsSearchTracker()
        let router = PushFlightsSearchRouter(detailScreenFactory: UIKitFlightDetailViewControllerFactory())
        composer.onLoad = [
            { getAllFlights.getFlights(forDestination: Destination(title: "London")) },
            firebase.viewDidLoad,
            customTracker.viewDidLoad
        ]
        composer.didSelect = [
            firebase.didSelect(flightWithId:),
            customTracker.didSelect(flightWithId:),
            router.routeToDetails(_:)
        ]
        let vc = FlightsSearchViewController(delegate: composer)
        router.rootViewController = vc
        presenter.view = vc
        return vc
    }
}
