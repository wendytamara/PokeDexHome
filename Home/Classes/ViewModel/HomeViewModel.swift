
import CoreEntities
import CorePokeDex

protocol HomeViewModelDelegateProtocol: AnyObject {
    func homeEvent(state: ViewControllerState)
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegateProtocol? { get set }
    var pokemons: [Pokemon] {get set}
    func requestList()
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var useCase: PokemonListingUseCase
    var pokemons: [Pokemon] = []
    weak var delegate: HomeViewModelDelegateProtocol?


    init(useCase: PokemonListingUseCase) {
        self.useCase = useCase
    }

    func requestList() {
        delegate?.homeEvent(state: .loading)
        useCase.execute(completion: { [weak self] result in
                            switch result {
                                case .success(let response):
                                    self?.pokemons = response
                                    self?.delegate?.homeEvent(state: .success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    self?.delegate?.homeEvent(state: .error)
                            }
                        })
    }
        
        
    
}
