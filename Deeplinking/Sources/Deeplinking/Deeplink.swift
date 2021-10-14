import Foundation

public struct Deeplink {
    public let url: URL
    
    public var queryItems: [URLQueryItem]? {
        URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems
    }
    
    public func queryItem(_ param: String) -> String? {
        queryItems?
            .first(where: { $0.name == param })?
            .value
    }
    
    public func contains(queryParam: String) -> Bool {
        queryItem(queryParam) != nil
    }
    
    public func contains(path: String) -> Bool {
        url.path.contains(path)
    }
    
    public func pathIs(_ path: String) -> Bool {
        url.path == path
    }
}

extension Deeplink: Equatable {
}
