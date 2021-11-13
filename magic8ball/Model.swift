//
//  Model.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 12.10.2021.
//

import Foundation

struct Magic: Decodable {
    var magic: Answers
}

struct Answers: Decodable {
    var answer: String
}
