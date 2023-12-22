//
//  PokemonCoverRepositoryUnitTest.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

import XCTest

@testable import Home

class PokemonCoverRepositoryUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testObtainCover() {
        let exp = expectation(description: "obtain image from mock")
        var success: Bool = false
        
        let dataSource = PokemonCoverMockData()
        let repository = PokemonCoverRepository(dataSource: dataSource)
        
        let routeImg = "https://www.serebii.net/pokemongo/pokemon/001.png"
        
        repository.performCoverRequest(
            routeImg: routeImg,
            completion: { result in
                switch result {
                case .success(let coverImage):
                    XCTAssertNotNil(coverImage)
                    success = true
                case .failure(let error):
                    print(error)
                    success = false
                }
                exp.fulfill()
            }
        )
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertEqual(success, true)
        }
    }
}
