//
//  MainViewModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 16.11.2021.
//

import UIKit

class MainViewModel {
    private let model: MainModel    
    init(model: MainModel) {
        self.model = model
    }
    func displayAnswer(completion: @escaping (_ answer: String?) -> Void) {
        model.displayAnswer { (answer) in
            completion(answer)
        }
    }
    func getSettingsViewModel() -> SettingsViewModel {
        return SettingsViewModel(model: model.getSettingsModel())
    }
    func getHistoryViewModel() -> HistoryScreenViewModel {
        return HistoryScreenViewModel(with: model.getHistoryModel())
    }
    func saveToHistory(_ answer: String) {
        model.saveHistoryAnswer(answer)
        print("saved to history")
    }
}
