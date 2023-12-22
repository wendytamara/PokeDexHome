//
//  PokemonViewModelTest.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

import XCTest

@testable import Home

class CoverViewModelTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testRequestCover() {
        let dataSource = PokemonCoverMockData()
        let repository = PokemonCoverRepository(dataSource: dataSource)
        let useCase = GetPokemonCoverUseCase(coversRepository: repository)
        let viewModel = CoverViewModel(useCase: useCase)
        
        let viewModelSpy = CoverViewModelDelegateSpy()
        viewModel.delegate = viewModelSpy
        
        let routeImage = "https://www.serebii.net/pokemongo/pokemon/001.png"
        
        viewModel.getCover(routeImg: routeImage)
        
        XCTAssertNotNil(viewModel.coverImage)
        XCTAssertEqual(viewModelSpy.currentState, .success)
    }
}
