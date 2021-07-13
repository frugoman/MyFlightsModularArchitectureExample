import MyFlightsSearchEngine

public protocol FlightsSearchView: AnyObject {
    func show(flights: FlightSearchViewModel)
}

public class FlightsSearchPresenter: GetFlightsForDestinationOutput {
    public weak var view: FlightsSearchView?
    public init() {}
    
    public func flightsFetched(_ flights: [Flight]) {
        view?.show(
            flights: FlightSearchViewModel(
                results: flights
                    .map {
                        FlightSearchViewModel.Flight(
                            id: $0.id,
                            name: $0.name.capitalized,
                            duration: "\($0.duration)mins.")
                    }
            )
        )
    }
}
