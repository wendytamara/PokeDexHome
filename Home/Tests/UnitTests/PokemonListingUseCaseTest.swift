//
//  PokemonListingUseCaseTest.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//


import XCTest

@testable import Home
@testable import CoreEntities

class PokemonListingUseCaseyUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testExecuteListing() {
        let exp = expectation(description: "the use case calls the repository")
        var success: Bool = false
        
        let dataSource = PokemosMockDataSource()
        let repository = RemotePokemonRepository(dataSource: dataSource)
        let useCase = PokemonListingUseCase(pokemonRepository: repository)
        

        useCase.execute(
            completion: { result in
            switch result {
            case .success(let domainBooksArray):
                print(domainBooksArray)
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
