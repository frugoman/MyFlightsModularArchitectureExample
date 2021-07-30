import XCTest
@testable import FlightsSearchPresentation

final class FlightsSearchViewControllerTests: XCTestCase {
    
    func testWhenFlightsFetchedThenShowThem() throws {
        let delegate = MockDelegate()
        let sut = FlightsSearchViewController(delegate: delegate)
        _ = sut.view
        XCTAssertTrue(delegate.didLoad)
        let flights = FlightSearchViewModel(
            results: [
                .init(id: "id 1", name: "name 1", duration: "duration 1"),
                .init(id: "id 2", name: "name 2", duration: "duration 2")
            ]
        )
        sut.show(flights: flights)

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
        let cell0Text = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.textLabel?.text
        XCTAssertEqual(cell0Text, "name 1")
    }

    class MockDelegate: FlightsSearchViewControllerDelegate {
        var didLoad = false
        var selected: String?
        
        func viewDidLoad() {
            didLoad = true
        }
        
        func didSelect(flightWithId flightId: String) {
            selected = flightId
        }
    }
}
