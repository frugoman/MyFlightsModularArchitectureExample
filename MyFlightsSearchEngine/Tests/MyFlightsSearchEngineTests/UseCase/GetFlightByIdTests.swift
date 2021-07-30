import XCTest
@testable import MyFlightsSearchEngine

final class GetFlightByIdTests: XCTestCase {
    
    func testGetFlightByIdFound() {
        let output = MockOutput()
        let flights = [Flight(id: "1", name: "name", duration: 2)]
        let dataSource = MockDataSource(flights: flights)
        let sut = GetFlightById(output: output, datasource: dataSource)
        
        sut.getFlight(byId: "1")
        
        XCTAssertEqual(dataSource.queried, "1")
        XCTAssertNil(output.notFetched)
        XCTAssertEqual(output.fetched?.id, "1")
    }
    
    func testGetFlightByIdNotFound() {
        let output = MockOutput()
        let dataSource = MockDataSource(flights: [])
        let sut = GetFlightById(output: output, datasource: dataSource)
        
        sut.getFlight(byId: "1")
        
        XCTAssertEqual(dataSource.queried, "1")
        XCTAssertNil(output.fetched)
        XCTAssertEqual(output.notFetched, "1")
    }
    
    class MockOutput: GetFlightByIdOutput {
        var fetched: Flight?
        var notFetched: String?
        
        func flightFetched(_ flight: Flight) {
            self.fetched = flight
        }
        
        func flightNotFound(id: String) {
            notFetched = id
        }
    }
}
