import UIKit
import FlightsSearchPresentation
import MyFlightsSearchEngine
import MyFlightsDeeplinking

class UIKitFlightsSearchViewControllerFactory {
    private let onFlightSelected: (String) -> Void
    
    init(onFlightSelected: @escaping (String) -> Void) {
        self.onFlightSelected = onFlightSelected
    }
    
    func viewController() -> UIViewController {
        let presenter = FlightsSearchPresenter()
        let dataSource = LocalWithFallbacksFlightsDataSource(
            local: InMemoryFlightsDataSource(),
            fallback: RemoteFlightsDataSource()
        )
        let getAllFlights = GetFlightsForDestination(output: presenter, datasource: dataSource)
        
        let firebase = FirebaseFlightsSearchTracker()
        let customTracker = CustomServiceFlightsSearchTracker()
        
        let composer = FlightsSearchViewControllerComposer()
        composer.onLoad = [
            { getAllFlights.getFlights(forDestination: Destination(title: "London")) },
            firebase.viewDidLoad,
            customTracker.viewDidLoad
        ]
//        let router = UIKitPushFlightsSearchRouter(detailScreenFactory: UIKitFlightDetailViewControllerFactory())
        composer.didSelect = [
            firebase.didSelect(flightWithId:),
            customTracker.didSelect(flightWithId:),
//            router.routeToDetails(_:)
            onFlightSelected
        ]
        
        let vc = FlightsSearchViewController(delegate: composer)
        
//        router.rootViewController = vc
        presenter.view = vc
        
        return vc
    }
}
