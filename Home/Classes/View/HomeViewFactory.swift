

import UIKit
import CoreEntities

public class HomeViewFactory {
    static let moduleBundle = Bundle(for: HomeViewFactory.self)

    public static func getFirstView() -> HomeViewController? {
        guard let homeViewController = UIStoryboard.init(
            name: "Home",
            bundle: moduleBundle
        ).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        else { return nil}
        return homeViewController
    }
    
    
    static func getPokemonDetailsView(pokemon: Pokemon) -> PokemonDetailsViewController? {
        guard let pokemonDetailsViewController = UIStoryboard.init(
            name: "Home",
            bundle: moduleBundle
        ).instantiateViewController(withIdentifier: "PokemonDetailsViewController") as? PokemonDetailsViewController
        else { return nil}
            let cardImageUseCase = GetCardImageUseCase()

            let detailsViewModel = PokemonDetailViewModel(pokemon: pokemon, useCase: cardImageUseCase)
            pokemonDetailsViewController.pokemonDetailViewModel = detailsViewModel
            let coverUseCase = GetPokemonCoverUseCase()
            let coverViewModel = CoverViewModel(useCase: coverUseCase)
            pokemonDetailsViewController.pokemonCoverViewModel = coverViewModel
        

        return pokemonDetailsViewController
    }
    

}

