//
//  HistoryScreenModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 29.11.2021.
//

import Foundation
class HistoryScreenModel {
    struct AnswerHistoryModel {
        let date: Date
        let message: String
    }
    private let storage: HistoryService
    init(storage: HistoryService = HistoryService()) {
        self.storage = storage
    }
    func getAnswer() -> [AnswerHistoryModel] {
        return storage.getAnswer().map { AnswerHistoryModel.init(date: $0.date, message: $0.message) }
    }
}
