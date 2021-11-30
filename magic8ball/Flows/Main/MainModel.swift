//
//  MainModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 16.11.2021.
//

import Foundation

class MainModel {
    private let saveData: DataBaseProtocol
    private let storage: HistoryService
    init(saveData: DataBaseProtocol, storage: HistoryService = HistoryService()) {
        self.saveData = saveData
        self.storage = storage
    }
    func displayAnswer(completion: @escaping (_ answer: String?) -> Void) {
        saveData.displayAnswer { (answer) in
            completion(answer)
        }
    }    
    func getSettingsModel() -> SettingsModel {
        return SettingsModel(saveData: saveData)
    }
    func getHistoryModel() -> HistoryScreenModel {
        return HistoryScreenModel(storage: storage)
    }
    func saveHistoryAnswer(_ answer: String) {
        storage.saveAnswer(answer)
    }
}
