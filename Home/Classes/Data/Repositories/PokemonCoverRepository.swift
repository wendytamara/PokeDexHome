//
//  PokemonCoverRepository.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//


import Foundation
import CoreEntities

final class PokemonCoverRepository: PokemonCoverRepositoryProtocol {

    var dataSource: PokemonCoverDataSourceProtocol
    
    init(dataSource: PokemonCoverDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func performCoverRequest( routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        dataSource.getCover(
            routeImg: routeImg,
            completion:
                { result in
            switch result {
            case .success(let coverImage):
            
                completion(.success(coverImage))

            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
