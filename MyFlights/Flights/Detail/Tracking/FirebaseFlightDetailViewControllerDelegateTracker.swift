import FlightsSearchPresentation

class FirebaseFlightDetailViewControllerDelegateTracker: FlightDetailViewControllerDelegate {
    func viewDidLoad(withId id: String) {
        print("Tracking flight \(id) on Firebase")
    }
}
