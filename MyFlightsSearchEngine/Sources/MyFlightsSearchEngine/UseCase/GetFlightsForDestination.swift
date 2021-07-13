public protocol GetFlightsForDestinationOutput {
    func flightsFetched(_ flights: [Flight])
}

public struct Destination {
    public let title: String
    
    public init(title: String) {
        self.title = title
    }
}

public class GetFlightsForDestination {
    private let output: GetFlightsForDestinationOutput
    private let datasource: FlightsDataSource
    
    public init(output: GetFlightsForDestinationOutput, datasource: FlightsDataSource) {
        self.output = output
        self.datasource = datasource
    }
    
    public func getFlights(forDestination destination: Destination) {
        datasource.getFlights(forLocation: destination.title) { flights in
            output.flightsFetched(
                flights
                    .sorted(by: { $0.name < $1.name })
                    .filter { $0.duration > 20 }
            )
        }
    }
}
