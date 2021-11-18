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
}
