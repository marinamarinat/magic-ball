//
//  SettingsModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 16.11.2021.
//

import Foundation

class SettingsModel {
    private let saveData: DataBaseProtocol
    init(saveData: DataBaseProtocol) {
        self.saveData = saveData
    }
    func displayAnswer(completion: @escaping (_ answer: String?) -> Void) {
        saveData.displayAnswer { (answer) in
            completion(answer)
        }
    }
    func getAnswersFromDB() -> [String] {
        saveData.getAnswersFromDB()
    }  
    func addAnswerToDB(_ answer: String) {
        saveData.addAnswerToDB(answer)
    }
    func removeAnswerFromDB(at index: Int) {
        saveData.removeAnswerFromDB(at: index)
    }
}
