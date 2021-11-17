//
//  UserDefaults.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 17.11.2021.
//

import Foundation

protocol UserDefaultsProtocol {
    var userAnswers: [String] { get set }
}

class UserDefaultsManager: UserDefaultsProtocol {

    private let defaults = UserDefaults.standard

    var userAnswers: [String] {
        get {
           defaults.object(forKey: "userAnswers") as? [String] ?? [""]
        }
        set {
            defaults.set(newValue, forKey: "userAnswers")
        }
    }
}
