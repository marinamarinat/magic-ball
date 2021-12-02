//
//  HistoryScreenViewModel.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 29.11.2021.
//

import Foundation
import RealmSwift

class HistoryScreenViewModel {
    private var answers: [PresentedAnswer] = []
    private let model: HistoryScreenModel
    init(with model: HistoryScreenModel) {
        self.model = model
    }    
    struct Answers {
        let date: String
        let message: String
    }
    //    print("loading info")
    func loadInfo(completion: @escaping (_ hasHistoryUpdated: Bool) -> Void) {
        model.getAnswer { (historyAnswers) in
                    guard let historyAnswers = historyAnswers else { return }
                    self.answers = historyAnswers
                    completion(true)
                }
//        self.answers = model.getAnswer(){
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//            return Answers.init(date: dateFormatter.string(from: $0.date), message: $0.message)
//        }
    }
    func numberOfRowsInSection() -> Int {
        return answers.count
    }
    func message(for index: Int) -> String {
        return answers[index].message
    }    
    func dateString(for index: Int) -> String {
        return answers[index].date as? String ?? "x"
    }
}
