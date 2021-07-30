import XCTest
import MyFlightsSearchEngine
@testable import FlightsSearchPresentation

final class FlightsDetailPresenterTests: XCTestCase {
    
    func testWhenFlightFetchedThenPresentIt() throws {
        let flight = Flight(id: "some id", name: "name", duration: 2)
        let view = MockView()
        let sut = FlightDetailPresenter()
        sut.view = view
        sut.flightFetched(flight)
        
        let flightViewModel = try XCTUnwrap(view.flight)
        XCTAssertEqual(flightViewModel.name, "Name")
        XCTAssertEqual(flightViewModel.duration, "Flight lasts 2mins.")
        XCTAssertNil(view.error)
    }
    
    func testWhenFlightNotFoundThenPresentError() throws {
        let view = MockView()
        let sut = FlightDetailPresenter()
        sut.view = view
        sut.flightNotFound(id: "some id")
        
        XCTAssertEqual(view.error, "Flight some id was not found, sorry!")
        XCTAssertNil(view.flight)
    }
    
    class MockView: FlightsDetailView {
        var error: String?
        var flight: FlightDetailViewModel?
        
        func show(flight: FlightDetailViewModel) {
            self.flight = flight
        }
        
        func showErrorMessage(_ message: String) {
            self.error = message
        }
    }
}
