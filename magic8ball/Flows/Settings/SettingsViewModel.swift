//
//  SettingsViewModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 16.11.2021.
//

import Foundation

class SettingsViewModel {
    private let model: SettingsModel
    private var answers: [String]
    init(model: SettingsModel) {
        self.model = model
        self.answers = model.getAnswersFromDB()
    }
    func displayAnswer(completion: @escaping (_ answer: String?) -> Void) {
        model.displayAnswer { (answer) in
            completion(answer)
        }
    }
    func addAnswerToDB(_ answer: String) {
        model.addAnswerToDB(answer)
        answers.append(answer)
    }
    func numberOfAnswers() -> Int {
        return answers.count
    }
    func answer(at index: Int) -> String {
        let answer = answers[index]
        return answer
    }    
    func removeAnswer(at index: Int) {
        model.removeAnswerFromDB(at: index)
        answers.remove(at: index)
    }
}
