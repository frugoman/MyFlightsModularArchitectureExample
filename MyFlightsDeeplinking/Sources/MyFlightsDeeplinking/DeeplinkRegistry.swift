import UIKit

public class DeeplinkRegistry {
    public static let shared = DeeplinkRegistry()
    private init(){}
    
    private var deeplinks = [String: DeeplinkScreenFactory]()
    
    public func register(screenFactory: DeeplinkScreenFactory, forPath path: String) {
        deeplinks[path] = screenFactory
    }
    
    public func getScreen(forPath path: URL) -> UIViewController? {
        return deeplinks[path.relativePath]?.screen(forPath: path)
    }
}

extension URL {
    public func value(forQuearyParam param: String) -> String? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?
            .queryItems?
            .first(where: { $0.name == param })?
            .value
    }
}
