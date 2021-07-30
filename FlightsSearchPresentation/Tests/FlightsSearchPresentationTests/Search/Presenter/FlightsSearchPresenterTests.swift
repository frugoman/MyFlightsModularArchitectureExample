import XCTest
import MyFlightsSearchEngine
@testable import FlightsSearchPresentation

final class FlightsSearchPresenterTests: XCTestCase {
    
    func testWhenFlightsFetchedThenPresentThem() throws {
        let flight1 = Flight(id: "some id 1", name: "name 1", duration: 2)
        let flight2 = Flight(id: "some id 2", name: "name 2", duration: 4)
        let flights = [flight1, flight2]
        let view = MockView()
        let sut = FlightsSearchPresenter()
        sut.view = view
        sut.flightsFetched(flights)
        
        let flightsViewModel = try XCTUnwrap(view.flights?.results)
        XCTAssertEqual(flightsViewModel.count, 2)
        XCTAssertEqual(flightsViewModel[0].id, "some id 1")
        XCTAssertEqual(flightsViewModel[1].id, "some id 2")
    }
    
    class MockView: FlightsSearchView {
        var flights: FlightSearchViewModel?
        
        func show(flights: FlightSearchViewModel) {
            self.flights = flights
        }
    }
}
