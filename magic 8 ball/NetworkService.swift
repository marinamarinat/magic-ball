//
//  NetworkService.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 16.10.2021.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Magic?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(nil, error)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let answer = try JSONDecoder().decode(Magic.self, from: data)
                    print(answer)
                    completion(answer, nil)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
