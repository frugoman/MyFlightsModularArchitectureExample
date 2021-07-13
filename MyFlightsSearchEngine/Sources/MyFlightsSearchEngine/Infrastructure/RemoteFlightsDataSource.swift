public class RemoteFlightsDataSource: FlightsDataSource {
    private let flights = [
        Flight(id: "3", name: "test 3", duration: 40),
        Flight(id: "4", name: "test 4", duration: 50)
    ]
    
    public init() {}
    public func getFlights(forLocation location: String, callback: ([Flight]) -> Void) {
        callback(flights)
    }
    
    public func getFlight(byId id: String, callback: (Flight?) -> Void) {
        let flight = flights.first { $0.id == id }
        callback(flight)
    }
}
