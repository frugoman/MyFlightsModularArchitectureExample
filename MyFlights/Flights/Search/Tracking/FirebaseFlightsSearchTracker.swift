import FlightsSearchPresentation

class FirebaseFlightsSearchTracker: FlightsSearchViewControllerDelegate {
    func viewDidLoad() {
        print("Tracking on Firebase")
    }
    
    func didSelect(flightWithId flightId: String) {
        print("Tracking selection on Firebase \(flightId)")
    }
}
