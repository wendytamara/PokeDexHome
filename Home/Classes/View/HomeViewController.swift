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
