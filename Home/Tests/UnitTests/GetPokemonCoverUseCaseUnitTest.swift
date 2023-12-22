//
//  GetPokemonCoverUseCaseUnitTest.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

import XCTest

@testable import Home

class GetPokemonCoverUseCaseUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testExecuteGetCover() {
        let exp = expectation(description: "the use case calls the repository")
        var success: Bool = false
        
        let dataSource = PokemonCoverMockData()
        let repository = PokemonCoverRepository(dataSource: dataSource)
        let useCase = GetPokemonCoverUseCase(coversRepository: repository)
        
        let routeImg = "https://www.serebii.net/pokemongo/pokemon/001.png"

        
        useCase.execute(
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
