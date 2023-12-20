//
//  GetPokemonCoverUseCase.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import Foundation
import CoreEntities

protocol GetPokemonCoverUseCaseProtocol {
    func execute(routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void) -> Void
}

final class GetPokemonCoverUseCase: GetPokemonCoverUseCaseProtocol {
    
    private var coversRepository: PokemonCoverRepositoryProtocol?
    
    init(coversRepository: PokemonCoverRepositoryProtocol) {
        self.coversRepository = coversRepository
    }
    init(){}
    
    func execute(
        routeImg: String,completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        if coversRepository == nil {
            var dataSource: PokemonCoverDataSourceProtocol
            if FileHelper.fileExistsInCache(fileName: routeImg) {
                /// CacheDataSource
                dataSource = PokemonCoverCacheDataSource()
            } else {
                /// RemoteDataSource
                dataSource = PokemonCoverRemoteDataSource()
            }
            coversRepository = PokemonCoverRepository(dataSource: dataSource)
        }
        
        coversRepository?.performCoverRequest(
            routeImg: routeImg,
            completion: { result in
                completion(result)
            })
    }}
