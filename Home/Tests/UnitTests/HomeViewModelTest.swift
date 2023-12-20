//
//  HomeViewModelTest.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//


import XCTest
@testable import CoreEntities

@testable import Home

class HomeViewModelUnitTest: XCTestCase {
    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testRequestList() {
        let dataSource = PokemosMockDataSource()
        let repository = RemotePokemonRepository(dataSource: dataSource)
        let useCase = PokemonListingUseCase(pokemonRepository: repository)
        let viewModel = HomeViewModel(useCase: useCase)
        
        let viewModelSpy = HomeViewModelDelegateSpy()
        viewModel.delegate = viewModelSpy
        

        
        viewModel.requestList()
        
        XCTAssertNotNil(viewModel.pokemons)
        XCTAssertEqual(viewModelSpy.currentState, .success)
    }
}
