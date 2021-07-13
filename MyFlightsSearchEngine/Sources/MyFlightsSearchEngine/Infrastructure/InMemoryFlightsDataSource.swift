public class InMemoryFlightsDataSource: FlightsDataSource {
    private let flights = [
        Flight(id: "1", name: "test", duration: 10),
        Flight(id: "2", name: "test 2", duration: 30)
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
