//
//  PokemonDetailsViewController.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 20/12/23.
//
import CorePokeDex

public class PokemonDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var bgCard: UIImageView!
    @IBOutlet weak var bgImgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var lblAvalability: UILabel!
    @IBOutlet weak var lblWeacknesS: UILabel!
    @IBOutlet weak var lblResitence: UILabel!
    @IBOutlet weak var lblType: UILabel!  
    @IBOutlet weak var imgLogo: UIImageView!    
    
    var pokemonDetailViewModel: PokemonDetailViewModelProtocol?
    var pokemonCoverViewModel: CoverViewModelProtocol?

    
    public override func viewDidLoad() {
        
        pokemonCoverViewModel?.delegate = self

        
        if let pokemon = pokemonDetailViewModel?.pokemon {
                        
            let typePokemon = pokemon.type[0]
            
            if let cardPokemon = pokemonDetailViewModel?.getCardByType(type: typePokemon) {
                bgCard.image = ResourcesHelper.getImageFromBundle(imageName: cardPokemon)           
            }
                
            
            bgImgCover.image = ResourcesHelper.getImageFromBundle(imageName: "bg_gradient")
            imgLogo.image = ResourcesHelper.getImageFromBundle(imageName: "Logo")

            lblTitle.text = pokemon.name.capitalized  
            lblAbout.text = pokemon.about
            lblAvalability.text = pokemon.specialAtack[0].name.capitalized
            lblWeacknesS.text = pokemon.weaknesses[0]
            lblResitence.text = pokemon.resistant[0]
            lblType.text = typePokemon.capitalized
            
            pokemonCoverViewModel?.getCover(routeImg: pokemon.img)
        }
    } 
}


extension PokemonDetailsViewController : PokemonCoverViewModelDelegateProtocol {
    func coverEvent(state: ViewControllerState) {
        switch state {
        case .success:
            self.imgCover.image = pokemonCoverViewModel?.coverImage
        case .loading:
            print("loading")
        case .error:
            self.imgCover.image = ResourcesHelper.getImageFromBundle(imageName: "book_placeholder")
        }
    }
    
    
}
