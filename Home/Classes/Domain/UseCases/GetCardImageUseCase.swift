//
//  GetCardImageUseCase.swift
//  Pods
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

class GetCardImageUseCase {
    
     let allTypePokemons = ["fire", "poison", "electric", "bug",  "normal", "ground", "grass", "water", "fighting", "psychic", "rock", "ghost"]
    
     func getCardByType(type:String) -> String {
        var routeImage: String
        
        if (allTypePokemons.contains(type)) {
            routeImage = "card_\(type).png"
        }
        else {
            routeImage = "card_normal.png"
        }
        
        return routeImage
    }
}
