//
//  PokemonRemoteDataSource.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

class PokemonRemoteDataSource: PokemonDataSourceProtocol {
    func list(completion: @escaping (Result<PokemonsResponseDTO, Error>) -> Void) {
        HomeTask.doRequest(completion: completion)
    }
}
