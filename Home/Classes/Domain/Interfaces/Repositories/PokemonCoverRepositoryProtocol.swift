//
//  PokemonCoverRepositoryProtocol.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import CoreEntities

protocol PokemonCoverRepositoryProtocol {
    func performCoverRequest(routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void) -> Void
}
