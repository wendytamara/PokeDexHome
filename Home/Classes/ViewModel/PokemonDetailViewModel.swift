//
//  PokemonDetailViewModel.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 20/12/23.
//

import CorePokeDex
import CoreEntities


protocol PokemonDetailViewModelProtocol {
    var pokemon : Pokemon { get set }
    
    func getCardByType(type: String) -> String
}


final class PokemonDetailViewModel: PokemonDetailViewModelProtocol { 
    
    var pokemon : Pokemon
    var useCase: GetCardImageUseCase
    
    init(pokemon: Pokemon, useCase: GetCardImageUseCase) {
        self.pokemon = pokemon
        self.useCase = useCase
    }
    
    func getCardByType (type: String) -> String {
       return useCase.getCardByType(type: type)
    }
 
}
