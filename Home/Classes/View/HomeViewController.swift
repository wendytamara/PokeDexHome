//
//  HomeViewController.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 18/12/23.
//


import UIKit
import CorePokeDex
import CoreEntities

public class HomeViewController: UIViewController {
    
    var homeViewModel: HomeViewModelProtocol?

    // se necesita una referencia a la tabla del storyboard, table view
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var txtLabel: UILabel!
    var coordinator: Coordinator?


    
    public override func viewDidLoad() {
        
        let dataSource = PokemonRemoteDataSource()
        let repository = RemotePokemonRepository(dataSource: dataSource)
        let useCase = PokemonListingUseCase(pokemonRepository: repository)
        homeViewModel = HomeViewModel(useCase: useCase)

        homeViewModel?.delegate = self
        
        homeViewModel?.requestList()
    }
}

// para mostrar el tableView necesita de un delegate y un dataSource
// se le tiene que indicar a la tabla quien es su dataSource, ubicandose en en storyboard, en la tabla y abriendo el detalle en outlets y jalando el item a el homeViewController, el que aparece en la lista de items del storyboard

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // de devuelve la cantidad de registros que tiene la data
        homeViewModel?.pokemons.count ??  0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // aqui tiene retornar una celda
        
        let pokemonCell =
            self.homeTableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        pokemonCell.getCover(pokemon: homeViewModel?.pokemons[indexPath.row])
        pokemonCell.lblTitle.text = homeViewModel?.pokemons[indexPath.row].name.capitalized
        
        return pokemonCell
    }
    
}



extension HomeViewController: HomeViewModelDelegateProtocol {
    func homeEvent(state: ViewControllerState) {
        switch state {
        case .success:
//            actIndFetchData.stopAnimating()
            homeTableView.reloadData()
        case .loading:
            print("borrar")

//            self.txtTopic.backgroundColor = UIColor.clear
//            actIndFetchData.startAnimating()
        case .error:
            print("borrar")
//            actIndFetchData.stopAnimating()
//            self.txtTopic.backgroundColor = UIColor.red
        }
    }
}
