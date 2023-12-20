//
//  PokemonCell.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import UIKit
import CoreEntities
import CorePokeDex

class PokemonCell: UITableViewCell {

    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgCover: UIImageView!
    
    
    var useCase: GetPokemonCoverUseCaseProtocol?
    var viewModel: CoverViewModelProtocol?
    
    
    public var pokemon: Pokemon?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
            
        useCase = GetPokemonCoverUseCase()
        if let useCase = useCase {
            viewModel = CoverViewModel(useCase: useCase)
            viewModel?.delegate = self
        }
    }
    
    
    public func getCover(pokemon: Pokemon?){
        self.pokemon = pokemon
        if let coverID = self.pokemon?.img {
            let indexcut = coverID.lastIndex(of: "/")
            print(String(coverID[indexcut!...]))
            
            
            
            viewModel?.getCover(routeImg: String(coverID[indexcut!...]))
        }
    }
    
    
    
}


extension PokemonCell: PokemonCoverViewModelDelegateProtocol {
    func coverEvent(state: CorePokeDex.ViewControllerState) {
//        print(pokemon, "wendy 50")

        switch state {
        case .success:
//            self.actIndCover.stopAnimating()
            self.imgCover.image = viewModel?.coverImage
            print("success \(pokemon?.img)")
        case .loading:
//            self.actIndCover.startAnimating()
            print("loading: \(pokemon?.img) ")
        case .error:
            print("error")
        }
    }
}

