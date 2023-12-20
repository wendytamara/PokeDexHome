
@testable import Home
@testable import CoreEntities

class PokemosMockDataSource: PokemonDataSourceProtocol {

    func list(
        completion: @escaping (Result<PokemonsResponseDTO, Error>) -> Void
    ) {
        do {
            let responseDTO = try JSONDecoder().decode(PokemonsResponseDTO.self, from: Data(JSONDataProvider.booksDTOResponse.utf8))
            completion(.success(responseDTO))
        } catch {
            completion(.failure(error))
        }
    }
}
