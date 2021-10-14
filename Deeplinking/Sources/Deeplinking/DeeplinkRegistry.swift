import Foundation

public class DeeplinkRegistry {
    let defaultDeeplinkHandler: DeeplinkHandler
    var deeplinkHandlers = [DeeplinkHandler]()
    
    public init(defaultDeeplinkHandler: DeeplinkHandler) {
        self.defaultDeeplinkHandler = defaultDeeplinkHandler
    }
    
    public func register(deeplinkHandler: DeeplinkHandler) {
        deeplinkHandlers.append(deeplinkHandler)
    }
    
    public func execute(url: URL) {
        let deeplink = Deeplink(url: url)
        deeplinkHandler(for: deeplink).handle(url: deeplink)
    }
    
    private func deeplinkHandler(for deeplink: Deeplink) -> DeeplinkHandler {
        deeplinkHandlers
            .first { $0.canHandle(url: deeplink) }
            ?? defaultDeeplinkHandler
    }
}

public extension URL {
    static func orDefaultDeeplink(_ url: String) -> URL {
        guard let url = URL(string: url) else {
            return URL(string: "myFlights://default/url")!
        }
        return url
    }
}
