

import XCTest
@testable import CoreEntities

@testable import Home

class PokemonsRepositoryTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testRepositoryListing() {
        let exp = expectation(description: "backend is returning data and we can obtain domain entities")
        var success: Bool = false
        
        let dataSource = PokemonRemoteDataSource()
        let repository = RemotePokemonRepository(dataSource: dataSource)


        
        repository.performListRequest(completion: { result in
            switch result {
            case .success(let domainPokemonsArray):
                print(domainPokemonsArray)
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
