import MyFlightsDeeplinking

class DeeplinkRegistrator {
    func registerDeeplinks() {
        let registry = DeeplinkRegistry.shared
        let factories = [
            (
                DetailsDeeplinkScreenFactory(
                    factory: UIKitFlightDetailViewControllerFactory()
                ),
                "/detail"
            )
        ]
        
        factories.forEach { (factory, path) in
            registry.register(screenFactory: factory, forPath: path)
        }
        
    }
}
