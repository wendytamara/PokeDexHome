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
}


final class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
        
    var pokemon : Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
}
