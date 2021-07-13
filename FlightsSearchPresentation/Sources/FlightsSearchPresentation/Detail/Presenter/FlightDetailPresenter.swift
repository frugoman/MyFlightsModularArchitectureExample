import MyFlightsSearchEngine

public protocol FlightsDetailView: AnyObject {
    func show(flight: FlightDetailViewModel)
    
    func showErrorMessage(_ message: String)
}

public class FlightDetailPresenter: GetFlightByIdOutput {
    public weak var view: FlightsDetailView?
    public init() {}
    
    public func flightFetched(_ flight: Flight) {
        view?.show(
            flight: FlightDetailViewModel(
                flight:
                    FlightDetailViewModel.Flight(
                        id: flight.id,
                        name: flight.name.capitalized,
                        duration: "Flight lasts \(flight.duration)mins.")
            )
        )
    }
    
    public func flightNotFound(id: String) {
        view?.showErrorMessage("Flight \(id) was not found, sorry!")
    }
}
