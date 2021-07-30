import XCTest
@testable import FlightsSearchPresentation

final class FlightsDetailViewControllerTests: XCTestCase {
    
    func testWhenFlightFetchedThenShowIt() throws {
        let delegate = MockDelegate()
        let sut = FlightDetailViewController(flightId: "any id", delegate: delegate)
        _ = sut.view
        XCTAssertEqual(delegate.didLoadWithId, "any id")
        let flight = FlightDetailViewModel(id: "some id", name: "some name", duration: "some duration")
        sut.show(flight: flight)
        
        XCTAssertEqual(sut.contentLabel.text, "some name")
        XCTAssertEqual(sut.detailLabel.text, "some duration")
    }
    
    func testWhenShowErrorMessageCalledThenShowError() throws {
        let delegate = MockDelegate()
        let sut = FlightDetailViewController(flightId: "any id", delegate: delegate)
        _ = sut.view
        XCTAssertEqual(delegate.didLoadWithId, "any id")
        sut.showErrorMessage("message")
        
        XCTAssertEqual(sut.contentLabel.text, "message")
        XCTAssertEqual(sut.detailLabel.text, "Try again")
    }
    
    class MockDelegate: FlightDetailViewControllerDelegate {
        var didLoadWithId: String?
        func viewDidLoad(withId id: String) {
            didLoadWithId = id
        }
    }
}
