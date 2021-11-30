//
//  HistoryService.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 29.11.2021.
//

import Foundation
import RealmSwift

final class HistoryService {
    var realm: Realm {        
            do {
                let realm = try Realm()
                return realm
            } catch {
                print("Could not access database: ", error)
            }
            return self.realm
        
    }
    func saveAnswer(_ answer: String) {
        let object = PresentedAnswer()
        object.date = Date()
        object.message = answer
        DispatchQueue(label: "background").async {
            autoreleasepool {
                do {
                    try self.realm.write {
                        self.realm.add(object)
                        self.realm.refresh()
                    }
                } catch {
                    print("Could not write to database: ", error)
                }
            }
        }
    }
    func getAnswer() -> [PresentedAnswer] {
        DispatchQueue(label: "background").sync {
            let historyAnswers = realm.objects(PresentedAnswer.self).sorted(byKeyPath: PresentedAnswer.Property.date.rawValue, ascending: false)
            realm.refresh()
            let fetchedAnswers = Array(historyAnswers)
            print("fetching history answers")
            return fetchedAnswers
        }
    }
}
