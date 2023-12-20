//
//  CoverTask.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

import Foundation

struct ConnectionParametersCover {
    static func getEndPoint(codeImg: String) ->String {
        return "https://www.serebii.net/pokemongo/pokemon/\(codeImg)"
    }
 }

class CoverTask {
    static func doRequest(routeImg: String, completion: @escaping (Result<UIImage, Error>) -> Void) -> Void {
        
        let url = URL(string: ConnectionParametersCover.getEndPoint(codeImg: routeImg))!
        var request = URLRequest(url: url)
        
        print(routeImg, "routeImg")


        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                try FileHelper.writeDataToImageFile(data: data, fileName: routeImg)
                let image = try FileHelper.readImageFromFile(fileName: routeImg)
                if let image = image {
                    DispatchQueue.main.async {
                        completion(.success(image))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    print(error, "ppp")
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
