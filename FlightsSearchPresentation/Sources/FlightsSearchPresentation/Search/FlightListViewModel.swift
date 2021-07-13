public struct FlightSearchViewModel {
    public let results: [Flight]
    public struct Flight {
        public let id: String
        public let name: String
        public let duration: String
    }
}
