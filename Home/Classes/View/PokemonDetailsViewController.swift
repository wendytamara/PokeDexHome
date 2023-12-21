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
    
    var pokemonDetailViewModel: PokemonDetailViewModelProtocol?
    var pokemonCoverViewModel: CoverViewModelProtocol?

    
    public override func viewDidLoad() {
        
        pokemonCoverViewModel?.delegate = self

        
        if let pokemon = pokemonDetailViewModel?.pokemon {
            
            // añadirle elementos
            
            print(pokemon)
                
            bgCard.image = ResourcesHelper.getImageFromBundle(imageName: "fire")
            bgImgCover.image = ResourcesHelper.getImageFromBundle(imageName: "bg_heaven")
            lblTitle.text = pokemon.name.capitalized  
            lblAbout.text = pokemon.about
            lblAvalability.text = pokemon.specialAtack[0].name.capitalized
            lblWeacknesS.text = pokemon.weaknesses[0]
            lblResitence.text = pokemon.resistant[0]
            lblType.text = pokemon.type[0].capitalized
            
            let coverID = pokemon.img
            let indexcut = coverID.lastIndex(of: "/")
            pokemonCoverViewModel?.getCover(routeImg: String(coverID[indexcut!...]))                
        }
    } 
}


extension PokemonDetailsViewController : PokemonCoverViewModelDelegateProtocol {
    func coverEvent(state: ViewControllerState) {
        switch state {
        case .success:
//            self.actIndCover.stopAnimating()
            self.imgCover.image = pokemonCoverViewModel?.coverImage
        case .loading:
//            self.actIndCover.startAnimating()
            print("loading")
        case .error:
            self.imgCover.image = ResourcesHelper.getImageFromBundle(imageName: "book_placeholder")
//            self.actIndCover.stopAnimating()
        }
    }
    
    
}
