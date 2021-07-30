import XCTest
@testable import MyFlightsSearchEngine

final class GetFlightsForDestinationTests: XCTestCase {
    func testFlightsAreSortedAndBelow20MinDurationFiltered() {
        let output = MockOutput()
        let flights = [
            Flight(id: "1", name: "name 1", duration: 2),
            Flight(id: "3", name: "name 3", duration: 40),
            Flight(id: "2", name: "name 2", duration: 50)
        ]
        let dataSource = MockDataSource(flights: flights)
        let sut = GetFlightsForDestination(output: output, datasource: dataSource)
        
        sut.getFlights(forDestination: Destination(title: "any title"))
        
        XCTAssertNotNil(output.fetched)
        XCTAssertEqual(output.fetched?.count, 2)
        XCTAssertEqual(output.fetched?[0].id, "2")
        XCTAssertEqual(output.fetched?[1].id, "3")
        XCTAssertFalse(try XCTUnwrap(output.fetched).contains(where: { $0.id == "1" }))
        XCTAssertEqual(dataSource.queried, "any title")
    }
    
    class MockOutput : GetFlightsForDestinationOutput {
        var fetched: [Flight]?
        
        func flightsFetched(_ flights: [Flight]) {
            fetched = flights
        }
    }
}
