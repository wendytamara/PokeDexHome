//
//  CoverViewModel.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//


import CorePokeDex

protocol PokemonCoverViewModelDelegateProtocol: AnyObject {
    func coverEvent(state: ViewControllerState)
}

protocol CoverViewModelProtocol {
    var delegate: PokemonCoverViewModelDelegateProtocol? { get set }
    var coverImage: UIImage? {get set}
    func getCover(routeImg: String)
}

final class CoverViewModel: CoverViewModelProtocol {
    var delegate: PokemonCoverViewModelDelegateProtocol?
    var coverImage: UIImage?
    
    var useCase: GetPokemonCoverUseCaseProtocol

    init(useCase: GetPokemonCoverUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getCover(routeImg: String) {
        delegate?.coverEvent(state: .loading)
        useCase.execute(
            routeImg: routeImg,
            completion: { [weak self] result in
                switch result {
                    case .success(let coverImage):
                        self?.coverImage = coverImage
                        self?.delegate?.coverEvent(state: .success)
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.delegate?.coverEvent(state: .error)
                }
            })
    }
    
}
