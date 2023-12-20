//
//  PokemonCoverRemoteDataSource.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import Foundation

class PokemonCoverRemoteDataSource: PokemonCoverDataSourceProtocol {
    func getCover(routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        CoverTask.doRequest(routeImg: routeImg, completion: completion)
    }
}
