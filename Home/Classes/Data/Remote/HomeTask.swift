
import Foundation

struct ConnectionParameters {
    static let endpoint = "https://run.mocky.io/v3/bf147f4f-2987-48a7-b652-b4feb73d9415"
 }

class HomeTask {
    static func doRequest(completion: @escaping (Result<PokemonsResponseDTO, Error>) -> Void) -> Void {
        
        let url = URL(string: ConnectionParameters.endpoint)!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                do {
                    let responseDTO = try JSONDecoder().decode(PokemonsResponseDTO.self, from: data)
//                    print(responseDTO, "WENDY 30")

                    completion(.success(responseDTO))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

