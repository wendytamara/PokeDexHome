//
//  HomeBackendTest.swift
//  Home
//

import XCTest

@testable import Home

class PokemonsBackendTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testTaskEndpointCall() {
        let exp = expectation(description: "backend is returning data")
        var success: Bool = false

        HomeTask.doRequest(
            completion: { result in
            switch result {
            case .success(let pokemonsData):
                print(pokemonsData)
                success = true
            case .failure(let error):
                success = false
                print(error)
            }
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }
}
