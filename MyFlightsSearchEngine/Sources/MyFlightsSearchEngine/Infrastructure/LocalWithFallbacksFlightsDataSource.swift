public class LocalWithFallbacksFlightsDataSource: FlightsDataSource {
    private let local: FlightsDataSource
    private let fallback: FlightsDataSource
    
    public init(local: FlightsDataSource, fallback: FlightsDataSource) {
        self.local = local
        self.fallback = fallback
    }
    
    public func getFlights(forLocation location: String, callback: ([Flight]) -> Void) {
        local.getFlights(forLocation: location) { flights in
            fallback.getFlights(forLocation: location) { fallbackFlights in
                callback(fallbackFlights + flights)
            }
        }
    }
    
    public func getFlight(byId id: String, callback: (Flight?) -> Void) {
        local.getFlight(byId: id) { flight in
            if let flight = flight {
                callback(flight)
                return
            }
            fallback.getFlight(byId: id) { fallbackFlight in
                callback(fallbackFlight)
            }
        }
    }
}
