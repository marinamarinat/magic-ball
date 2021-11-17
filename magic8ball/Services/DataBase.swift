//
//  DataBase.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 17.11.2021.
//

import Foundation

protocol DataBaseProtocol {
    func displayAnswer(completion: @escaping (_ answer: String?) -> Void)
    func addAnswerToDB(_ answer: String)
    func getAnswersFromDB() -> [String]
}
class DataBase: DataBaseProtocol {
    private let networkDataProvider: NetworkDataProvider
    private var dataManager: UserDefaultsManager
    init(networkDataProvider: NetworkDataProvider = NetworkService(),
         dataManager: UserDefaultsManager = UserDefaultsManager()) {
        self.networkDataProvider = networkDataProvider
        self.dataManager = dataManager
    }
    func displayAnswer(completion: @escaping (_ answer: String?) -> Void) {
        if dataManager.userAnswers.count >= 2 {
            let localAnswer = dataManager.userAnswers.randomElement()?.uppercased()
            completion(localAnswer)
        } else {
            let urlString = L10n.url
            networkDataProvider.request(urlString: urlString) { (answer, error) in
                let answerUppercased = answer?.magic.answer.uppercased()
                completion(answerUppercased)
            }
        }
    }
    func addAnswerToDB(_ answer: String) {
        dataManager.userAnswers.append(answer)
    }
    func getAnswersFromDB() -> [String] {
        dataManager.userAnswers
    }
}
