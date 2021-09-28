import UIKit
import FlightsSearchPresentation
import MyFlightsSearchEngine

protocol FlightsSearchViewControllerFactory {
    func viewController() -> UIViewController
}

class UIKitFlightsSearchViewControllerFactory: FlightsSearchViewControllerFactory {
    private let detailsScreenFactory: FlightDetailViewControllerFactory
    
    init (detailsScreenFactory: FlightDetailViewControllerFactory) {
        self.detailsScreenFactory = detailsScreenFactory
    }
    
    func viewController() -> UIViewController {
        let presenter = FlightsSearchPresenter()
        let dataSource = LocalWithFallbacksFlightsDataSource(
            local: InMemoryFlightsDataSource(),
            fallback: RemoteFlightsDataSource()
        )
        let getAllFlights = GetFlightsForDestination(output: presenter, datasource: dataSource)
        let router = PushFlightsSearchRouter(detailScreenFactory: detailsScreenFactory)
        
        let firebase = FirebaseFlightsSearchTracker()
        let customTracker = CustomServiceFlightsSearchTracker()
        
        let composer = FlightsSearchViewControllerComposer()
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
        
        presenter.view = vc
        router.rootViewController = vc
        return vc
    }
}

private class FlightsSearchViewControllerComposer: FlightsSearchViewControllerDelegate {
    var onLoad = [() -> Void]()
    var didSelect = [((String) -> Void)]()
    
    func viewDidLoad() {
        onLoad.forEach { $0() }
    }
    
    func didSelect(flightWithId flightId: String) {
        didSelect.forEach { $0(flightId) }
    }
}
