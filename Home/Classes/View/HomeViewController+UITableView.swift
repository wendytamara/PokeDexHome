//
//  HomeViewController+UITableView.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 20/12/23.
//


// para mostrar el tableView necesita de un delegate y un dataSource
// se le tiene que indicar a la tabla quien es su dataSource, ubicandose en en storyboard, en la tabla y abriendo el detalle en outlets y jalando el item a el homeViewController, el que aparece en la lista de items del storyboard


/// TableViewDataSource
extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // de devuelve la cantidad de registros que tiene la data
        homeViewModel?.pokemons.count ??  0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // aqui tiene retornar una celda
        
        let pokemonCell =
            self.homeTableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        pokemonCell.pokemon = homeViewModel?.pokemons[indexPath.row]
        pokemonCell.setInitialData()
        pokemonCell.getCover()
        
        return pokemonCell
    }
}


// delegate

extension HomeViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
          guard let cellPokemon = homeViewModel?.pokemons[indexPath.row] else { return }
          if let detailsViewController = HomeViewFactory.getPokemonDetailsView(pokemon: cellPokemon) {
              self.coordinator?.present(viewController: detailsViewController)
          }
      }
}
