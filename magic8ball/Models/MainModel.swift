//
//  MainModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 16.11.2021.
//

import Foundation

class MainModel {
    private let network: NetworkDataProvider
    init(network: NetworkDataProvider) {
        self.network = network
    }
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
