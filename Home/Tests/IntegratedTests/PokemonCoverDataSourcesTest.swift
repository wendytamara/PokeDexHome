//
//  PokemonCoverDataSourcesTest.swift
//  Home-Unit-IntegratedTest
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

import XCTest

@testable import Home

class PokemonCoverDataSourcesTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testRemoteAndCacheDataSources() {
        let exp = expectation(description: "Get Cover from Service and read it from cache after")
        var success: Bool = false
        
        let dataSourceRemote = PokemonCoverRemoteDataSource()
        let dataSourceCache = PokemonCoverCacheDataSource()
        
        
        let routeImage = "001.png"

        
        dataSourceRemote.getCover(
            routeImg: routeImage,
            completion: { resultRemote in
                switch resultRemote {
                case .success(let coverImage):
                    XCTAssertNotNil(coverImage)
                    
                    XCTAssertTrue(FileHelper.fileExistsInCache(fileName: routeImage))
                    
                    dataSourceCache.getCover(
                        routeImg: routeImage,
                        completion: { resultCache in
                            switch resultCache {
                            case .success(let coverImage):
                                XCTAssertNotNil(coverImage)
                                success = true

                            case .failure(let error):
                                success = false
                                print(error)
                            }
                        }
                    )
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
