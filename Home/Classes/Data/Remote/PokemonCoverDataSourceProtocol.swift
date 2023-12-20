//
//  PokemonCoverDataSourceProtocol.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import Foundation

protocol PokemonCoverDataSourceProtocol {
    func getCover(routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}
