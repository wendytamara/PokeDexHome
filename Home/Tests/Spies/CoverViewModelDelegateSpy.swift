//
//  CoverViewModelDelegateSpy.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

@testable import Home
@testable import CorePokeDex

class CoverViewModelDelegateSpy: PokemonCoverViewModelDelegateProtocol {
    public var currentState: ViewControllerState?
    func coverEvent(state: CorePokeDex.ViewControllerState) {
        currentState = state
    }
}
