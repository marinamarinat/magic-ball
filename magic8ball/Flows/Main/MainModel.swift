//
//  MainModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 16.11.2021.
//

import Foundation

class MainModel {
    private let saveData: DataBaseProtocol
    init(saveData: DataBaseProtocol) {
        self.saveData = saveData
    }
    func displayAnswer(completion: @escaping (_ answer: String?) -> Void) {
        saveData.displayAnswer { (answer) in
            completion(answer)
        }
    }    
    func getSettingsModel() -> SettingsModel {
        return SettingsModel(saveData: saveData)
    }
}
