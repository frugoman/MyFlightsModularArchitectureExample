public protocol GetFlightByIdOutput {
    func flightFetched(_ flight: Flight)
    
    func flightNotFound(id: String)
}

public class GetFlightById {
    private let output: GetFlightByIdOutput
    private let datasource: FlightsDataSource
    
    public init(output: GetFlightByIdOutput, datasource: FlightsDataSource) {
        self.output = output
        self.datasource = datasource
    }
    
    public func getFlight(byId id: String) {
        datasource.getFlight(byId: id) { flight in
            guard let flight = flight else {
                output.flightNotFound(id: id)
                return
            }
            output.flightFetched(flight)
        }
    }
}
