

import Foundation
import CoreEntities

final class RemotePokemonRepository: PokemonRepositoryProtocol {
    var dataSource: PokemonDataSourceProtocol
    
    init(dataSource: PokemonDataSourceProtocol) {
        self.dataSource = dataSource
    }
    func performListRequest(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        
        dataSource.list(completion: { result in
            switch result {
            case .success(let PokemonsResponseDTO):
                var pokemonDomainArray: [Pokemon] = []
                for pokemonDTO in PokemonsResponseDTO.data.results {
                    pokemonDomainArray.append(pokemonDTO.toDomainComic())
                }
                completion(.success(pokemonDomainArray))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
