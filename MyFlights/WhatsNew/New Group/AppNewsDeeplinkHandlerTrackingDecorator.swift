import Deeplinking

public class AppNewsDeeplinkHandlerTrackingDecorator: DeeplinkHandler {
    let decoratee: AppNewsDeeplinkHandler
    
    public init(decoratee: AppNewsDeeplinkHandler) {
        self.decoratee = decoratee
    }
    
    public func canHandle(url: Deeplink) -> Bool {
        decoratee.canHandle(url: url)
    }
    
    public func handle(url: Deeplink) {
        print("Tracking alert with title '\(url.queryItem("title")!)'")
        decoratee.handle(url: url)
    }
}
