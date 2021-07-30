public struct Flight {
    public let id: String
    public let name: String
    public let duration: Int
    
    public init(id: String, name: String, duration: Int) {
        self.id = id
        self.name = name
        self.duration = duration
    }
}
