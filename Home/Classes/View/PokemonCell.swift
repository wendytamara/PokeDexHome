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
    @IBOutlet weak var imgBgCard: UIImageView!
    @IBOutlet weak var bgImgCover: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    
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
    
    
    public func getCover(){
        if let coverID = self.pokemon?.img {

            viewModel?.getCover(routeImg: coverID)
        }
    }
    
    
    public func setInitialData () {
                
        imgCover.image = ResourcesHelper.getImageFromBundle(imageName: "book_placeholder")
        lblTitle.text = pokemon?.name.capitalized      
        imgBgCard.image = ResourcesHelper.getImageFromBundle(imageName: "bg_card_small_normal")       
        bgImgCover.image = ResourcesHelper.getImageFromBundle(imageName: "bg_gradient")
        imgLogo.image = ResourcesHelper.getImageFromBundle(imageName: "Logo")

    }
}


extension PokemonCell: PokemonCoverViewModelDelegateProtocol {
    func coverEvent(state: CorePokeDex.ViewControllerState) {

        switch state {
        case .success:
            self.imgCover.image = viewModel?.coverImage
            print("success \(pokemon?.img)")
        case .loading:
            print("loading: \(pokemon?.img) ")
        case .error:
            print("error")
        }
    }
}

