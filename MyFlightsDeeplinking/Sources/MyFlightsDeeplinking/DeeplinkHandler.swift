public protocol DeeplinkHandler {
    func canHandle(url: Deeplink) -> Bool
    
    func handle(url: Deeplink)
}
