import FlightsSearchPresentation

class FlightDetailViewControllerDelegateComposer: FlightDetailViewControllerDelegate {
    var onLoad = [(String) -> Void]()
    
    func viewDidLoad(withId id: String) {
        onLoad.forEach { $0(id) }
    }
}
