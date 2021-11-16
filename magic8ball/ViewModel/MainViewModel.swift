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
        if SettingsViewController.answers.count >= 2 {
            let localAnswer = SettingsViewController.answers.randomElement()?.uppercased()
            completion(localAnswer)
        } else {
            let urlString = L10n.url
            model.request(urlString: urlString) { (answer, error) in
                let answerUppercased = answer?.magic.answer.uppercased()
                completion(answerUppercased)
            }
        }
    }
}
