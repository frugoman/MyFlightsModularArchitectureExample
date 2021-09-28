import Deeplinking
import WhatsNew

class WhatsNewRouter {
    private let deeplinkRegistry: DeeplinkRegistry
    
    init(deeplinkRegistry: DeeplinkRegistry) {
        self.deeplinkRegistry = deeplinkRegistry
    }
    
    func route(toNews news: WhatsNew) {
        let params = "title=\(news.title)&message=\(news.message)&action=\(news.action)"
        self.deeplinkRegistry
            .execute(url: .orDefaultDeeplink("myFlights://flights/whats_new?\(params)"))
    }
}
