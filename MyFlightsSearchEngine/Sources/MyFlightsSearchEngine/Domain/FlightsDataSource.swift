public protocol FlightsDataSource {
    func getFlights(forLocation location: String, callback: ([Flight]) -> Void)
    
    func getFlight(byId id: String, callback: (Flight?) -> Void)
}
