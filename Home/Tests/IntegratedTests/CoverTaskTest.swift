//
//  CoverTaskTest.swift
//  Home-Unit-IntegratedTest
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

import XCTest

@testable import Home

class CoverTaskTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testTaskEndpointCall() {
        let exp = expectation(description: "obtain cover image from Open Library API")
        var success: Bool = false
        
        let routeImg = "001.png"


        CoverTask.doRequest(
            routeImg: routeImg,
            completion: { result in
            switch result {
            case .success(let coverImage):
                print(coverImage)
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
