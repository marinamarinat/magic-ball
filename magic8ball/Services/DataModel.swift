//
//  Model.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 12.10.2021.
//

import Foundation
import RealmSwift

struct Magic: Decodable {
    var magic: Answers
}

struct Answers: Decodable {
    var answer: String
}

class PresentedAnswer: Object {
    enum Property: String {
        case message, date
    }    
    @objc dynamic var date: Date = Date()
    @objc dynamic var message: String = ""
}
