import FlightsSearchPresentation

class CustomServiceFlightsSearchTracker: FlightsSearchViewControllerDelegate {
    func viewDidLoad() {
        print("Tracking on Custom Service")
    }
    
    func didSelect(flightWithId flightId: String) {
        print("Tracking selection on Custom Service \(flightId)")
    }
}
