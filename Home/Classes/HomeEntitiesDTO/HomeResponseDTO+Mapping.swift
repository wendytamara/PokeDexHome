
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


struct PokemonAtack: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case name
        case type
        case baseDemage = "base-damage"
        case moveDurationSeg = "move-duration-seg"
    }
    
    let name: String
    let type: String
    let baseDemage: String
    let moveDurationSeg: String
    
}


struct PokemonStats: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case baseAttack = "base-attack"
        case baseDefense = "base-defense"
        case baseStamina = "max-cp"
        case maxCp = "max-hp"
        case maxHp = "base-stamina"
    }
    
    let baseAttack: String
    let baseDefense: String
    let baseStamina: String
    let maxCp: String
    let maxHp: String

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
        case type
        case specialAtack = "special-attack"

    }
    
    let idComic: String
    let name: String
    let about: String
    let img: String
    let resistant: Array<String>
    let weaknesses: Array<String>

    let type: Array<String>
    let specialAtack: [PokemonAtack]
    
}
// MARK: - Mappings to Domain

extension PokemonDTO {
    func toDomainComic() -> Pokemon {
        
        var domainAttacks: [CoreEntities.PokemonAtack] = []
        for pokemonAttack in specialAtack {
            let domainAttack = pokemonAttack.toDomainAttack()
            domainAttacks.append(domainAttack)
        }
        
        return .init(
            idComic: idComic,
            name: name,
            about: about,
            img: img,
            resistant: resistant,
            weaknesses: weaknesses,          
            type: type,
            specialAtack: domainAttacks
        )
    }
}


extension PokemonAtack {
    func toDomainAttack() -> CoreEntities.PokemonAtack {
        return .init(
            name: name,
            type: type,
            baseDemage: baseDemage,
            moveDurationSeg: moveDurationSeg
        )
    }
}
