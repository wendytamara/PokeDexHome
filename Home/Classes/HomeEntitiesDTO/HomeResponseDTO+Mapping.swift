
//
//  HomeResponseDTO+Mapping.swift
//  Home


import Foundation
import CoreEntities

struct PokemonsResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case status
        case code
        case data
    }
    let status: String
    let code: Int
    let data: PokemonsDataDTO
}

struct PokemonsDataDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case limit
        case total
        case results
    }
    let limit: Int
    let total: Int
    let results: [PokemonDTO]
}

//results
struct PokemonDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idComic = "num"
        case name
        case about
        case img
        case resistant
        case weaknesses
    }
    
    let idComic: String
    let name: String
    let about: String
    let img: String
    let resistant: Array<String>
    let weaknesses: Array<String>


}
// MARK: - Mappings to Domain

extension PokemonDTO {
    func toDomainComic() -> Pokemon {
        return .init(
            idComic: idComic,
            name: name,
            about: about,
            img: img,
            resistant: resistant,
            weaknesses: weaknesses
        )
    }
}
