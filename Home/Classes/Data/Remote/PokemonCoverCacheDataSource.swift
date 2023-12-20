//
//  PokemonCoverCacheDataSource.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import Foundation

class PokemonCoverCacheDataSource: PokemonCoverDataSourceProtocol {
    func getCover(routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        do {
            let coverImage = try FileHelper.readImageFromFile(fileName: routeImg)
            if let coverImage = coverImage {
                completion(.success(coverImage))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
