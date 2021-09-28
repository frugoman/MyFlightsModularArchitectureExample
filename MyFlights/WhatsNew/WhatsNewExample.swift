import WhatsNew

class WhatsNewExample {
    private let service: WhatsNewService
    private let onFetched: (WhatsNew) -> Void
    
    init(service: WhatsNewService, onFetched: @escaping (WhatsNew) -> Void) {
        self.service = service
        self.onFetched = onFetched
    }
    
    func fetch() {
        service.getWhatsNew { [weak self] news in
            self?.onFetched(news)
        }
    }
}
