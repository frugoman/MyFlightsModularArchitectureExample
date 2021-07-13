import FlightsSearchPresentation

class CustomServiceFlightDetailViewControllerDelegateTracker: FlightDetailViewControllerDelegate {
    func viewDidLoad(withId id: String) {
        print("Tracking flight \(id) on Custom Service")
    }
}
