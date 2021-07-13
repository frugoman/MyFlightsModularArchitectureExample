import FlightsSearchPresentation

class FlightsSearchViewControllerComposer: FlightsSearchViewControllerDelegate {
    var onLoad = [() -> Void]()
    var didSelect = [((String) -> Void)]()
    
    func viewDidLoad() {
        onLoad.forEach { $0() }
    }
    
    func didSelect(flightWithId flightId: String) {
        didSelect.forEach { $0(flightId) }
    }
}
