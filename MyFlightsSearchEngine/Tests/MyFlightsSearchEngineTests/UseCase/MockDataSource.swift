import MyFlightsSearchEngine

class MockDataSource: FlightsDataSource {
    private let flights: [Flight]
    var queried: String?
    
    init(flights: [Flight]) {
        self.flights = flights
    }
    
    func getFlight(byId id: String, callback: (Flight?) -> Void) {
        queried = id
        callback(flights.first)
    }
    
    func getFlights(forLocation location: String, callback: ([Flight]) -> Void) {
        queried = location
        callback(flights)
    }
}
