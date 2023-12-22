//
//  SearchPokemonsUseCase.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

import CoreEntities

class SearchPokemonsUseCase {
    
    func filterPokemonsByName(allPokemons: [Pokemon], name: String) -> [Pokemon] {      
        if (name.isEmpty) {
            return allPokemons
        }
        else {
            return allPokemons.filter{ $0.name.lowercased().contains(name.lowercased()) }

        }
    }
}
