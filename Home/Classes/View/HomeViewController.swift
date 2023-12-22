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
    
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    @IBOutlet weak var inputSearch: UISearchBar!
    
        
    @IBAction func btnSearch(_ sender: Any) {      
        homeViewModel?.filterPokemonsByName(name: inputSearch?.text ?? "" )
        homeTableView.reloadData()     
    }
    
    public override func viewDidLoad() {
        
        let dataSource = PokemonRemoteDataSource()
        let repository = RemotePokemonRepository(dataSource: dataSource)
        let useCase = PokemonListingUseCase(pokemonRepository: repository)
        
        let useCaseSearch = SearchPokemonsUseCase()

        homeViewModel = HomeViewModel(useCase: useCase, useCaseSearch: useCaseSearch)
        homeViewModel?.delegate = self
        homeViewModel?.requestList()
    }
}



extension HomeViewController: HomeViewModelDelegateProtocol {
    func homeEvent(state: ViewControllerState) {
        switch state {
        case .success:
            actIndicator.stopAnimating()
            homeTableView.reloadData()
        case .loading:
            actIndicator.startAnimating()
            print(".loading")

        case .error:
            actIndicator.stopAnimating()

            print(".error")
        }
    }
}
