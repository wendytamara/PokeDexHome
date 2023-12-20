

import CoreEntities

protocol PokemonRepositoryProtocol {
    func performListRequest(completion: @escaping (Result<[Pokemon], Error>) -> Void) -> Void
}
