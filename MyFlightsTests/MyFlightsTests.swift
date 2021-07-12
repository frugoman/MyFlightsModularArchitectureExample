//
//  MyFlightsTests.swift
//  MyFlightsTests
//
//  Created by Nicolas Frugoni on 08/07/2021.
//

import XCTest
@testable import MyFlights

class FlightsListViewControllerTests: XCTestCase {

    func test_viewDidLoad_callsViewDidLoadCallback() throws {
        var timesCalled = 0
        
        let sut = FlightsListViewController { timesCalled += 1 }
        _ = sut.view
        
        XCTAssertEqual(timesCalled, 1)
    }
}
