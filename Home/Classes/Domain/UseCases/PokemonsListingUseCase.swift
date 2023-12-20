
import CoreEntities

protocol PokemonListingUseCaseProtocol {
    func execute(completion: @escaping (Result<[Pokemon], Error>) -> Void) -> Void
}

final class PokemonListingUseCase: PokemonListingUseCaseProtocol {

    private let pokemonRepository: PokemonRepositoryProtocol

    init( pokemonRepository: PokemonRepositoryProtocol ) {

        self.pokemonRepository = pokemonRepository
    }

    func execute(completion: @escaping (Result<[Pokemon], Error>) -> Void) -> Void {

        pokemonRepository.performListRequest(completion: { result in
            completion(result)
        })
    }
}
