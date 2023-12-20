//
//  PokemonDataSourceProtocol.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

protocol PokemonDataSourceProtocol {
    func list(completion: @escaping (Result<PokemonsResponseDTO, Error>) -> Void)
}
