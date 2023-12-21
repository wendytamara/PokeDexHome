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
    
    let allTypePokemons = ["fire", "poison", "electric", "bug",  "normal", "ground", "grass", "water", "fighting", "psychic", "rock", "ghost"]
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    func getCardByType (type: String) -> String {
        var routeImage: String
        
        if (allTypePokemons.contains(type)) {
            routeImage = "card_\(type).png"
        }
        else {
            routeImage = "card_normal.png"
        }
        
        return routeImage    
    }
 
}
