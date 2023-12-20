//
//  DataSourceTest.swift
//  Home-Unit-IntegratedTest
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//


import XCTest
@testable import CoreEntities

@testable import Home

class PokemonsDataSourceTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testDatasourceListing() {
        let exp = expectation(description: "backend is returning data")
        var success: Bool = false
        
        let dataSource = PokemonRemoteDataSource()

        dataSource.list(completion: { result in
            switch result {
            case .success(let pokemonsResponseDTO):
                print(pokemonsResponseDTO)
                success = true
            case .failure(let error):
                print(error)
                success = false
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
