//
//  PokemonCoverMockData.swift
//  Home-Unit-UnitTests
//
//  Created by Wendy Tamara Quispe Quispe on 22/12/23.
//

@testable import Home

class PokemonCoverMockData: PokemonCoverDataSourceProtocol {
    func imageWithColor(width: Int, height: Int) -> UIImage {
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.green.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    func getCover(routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let mockImage = imageWithColor(width: 50, height: 50)
        completion(.success(mockImage))
    }
}
