
import CoreEntities
import CorePokeDex

protocol HomeViewModelDelegateProtocol: AnyObject {
    func homeEvent(state: ViewControllerState)
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegateProtocol? { get set }
    var pokemons: [Pokemon] {get set}
    var copyAllPokemons: [Pokemon] {get set}
    func requestList()
    func filterPokemonsByName(name: String)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var useCase: PokemonListingUseCase
    var useCaseSearch: SearchPokemonsUseCase

    var pokemons: [Pokemon] = []
    var copyAllPokemons: [Pokemon] = []

    weak var delegate: HomeViewModelDelegateProtocol?


    init(useCase: PokemonListingUseCase, useCaseSearch: SearchPokemonsUseCase) {
        self.useCase = useCase
        self.useCaseSearch = useCaseSearch
    }
    
    
    func filterPokemonsByName (name: String) {
        self.pokemons = useCaseSearch.filterPokemonsByName(allPokemons: copyAllPokemons, name: name)
    }
    

    func requestList() {
        delegate?.homeEvent(state: .loading)
        useCase.execute(completion: { [weak self] result in
                            switch result {
                                case .success(let response):
                                    self?.pokemons = response
                                    self?.copyAllPokemons = response
                                    self?.delegate?.homeEvent(state: .success)
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    self?.delegate?.homeEvent(state: .error)
                            }
                        })
    }
        
        
    
}
