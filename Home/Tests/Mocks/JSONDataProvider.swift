//
//  JSONDataProvider.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import Foundation

struct JSONDataProvider {
    static let pokemonsDTOResponse: String = """
{
    "code": 200,
    "status": "Ok",
    "copyright": "",
    "attributionText": "",
    "attributionHTML": "",
    "etag": "7f36f8c00041dc2947fcef3b66a98267686e7c6e",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 58194,
        "count": 20,
        "results": [
            {
                "num": "001",
                "name": "bulbasaur",
                "generation": {
                    "num": "generation i",
                    "name": "kanto"
                },
                "about": "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
                "img": "https://www.serebii.net/pokemongo/pokemon/001.png",
                "size": {
                    "height": "0.71 m",
                    "weight": "6.9 kg"
                },
                "pokemon-rarity": "normal",
                "type": [
                    "grass",
                    "poison"
                ],
                "encounter": {
                    "base-flee-rate": "0.1",
                    "base-capture-rate": "0.2"
                },
                "spawn-chance": "0.69",
                "stats": {
                    "base-attack": "118",
                    "base-defense": "111",
                    "base-stamina": "128",
                    "max-cp": "1115",
                    "max-hp": "113"
                },
                "resistant": [
                    "water",
                    "electric",
                    "grass",
                    "fighting",
                    "fairy"
                ],
                "weaknesses": [
                    "fire",
                    "ice",
                    "flying",
                    "psychic"
                ],
                "quick-move": [
                    {
                        "name": "vine whip",
                        "type": "grass",
                        "base-damage": "7",
                        "energy": "6",
                        "move-duration-seg": "0.6"
                    },
                    {
                        "name": "tackle",
                        "type": "normal",
                        "base-damage": "5",
                        "energy": "5",
                        "move-duration-seg": "0.5"
                    }
                ],
                "special-attack": [
                    {
                        "name": "sludge bomb",
                        "type": "poison",
                        "base-damage": "80",
                        "energy": "-50",
                        "move-duration-seg": "2.3"
                    },
                    {
                        "name": "seed bomb",
                        "type": "grass",
                        "base-damage": "55",
                        "energy": "-33",
                        "move-duration-seg": "2.1"
                    },
                    {
                        "name": "power whip",
                        "type": "grass",
                        "base-damage": "90",
                        "energy": "-50",
                        "move-duration-seg": "2.6"
                    }
                ],
                "egg": "2 km",
                "buddy-distance-km": "3",
                "evolution": {
                    "candy": "bulbasaur candy",
                    "next-evolution": [
                        {
                            "num": "002",
                            "name": "ivysaur",
                            "candy-cost": "25",
                            "next-evolution": [
                                {
                                    "num": "003",
                                    "name": "venusaur",
                                    "candy-cost": "100"
                                }
                            ]
                        }
                    ]
                }
            }
        ]
    }
}
"""
}
