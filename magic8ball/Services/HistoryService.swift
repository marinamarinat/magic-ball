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
        get {
            do {
                let realm = try Realm()
                return realm
            } catch {
                print("Could not access database: ", error)
            }
            return self.realm
        }
    }
    func saveAnswer(_ answer: String) {
        let object = PresentedAnswer()
        object.date = Date()
        object.message = answer
        do {
                    try realm.write {
                        realm.add(object)
                    }
                } catch {
                    print("Could not write to database: ", error)
                }
    }
    func getGivenAnswer() -> Results<PresentedAnswer> {
        return realm.objects(PresentedAnswer.self).sorted(byKeyPath: PresentedAnswer.Property.date.rawValue,
                                                           ascending: false)
    }
//    func getGivenAnswer() -> Results<PresentedAnswer> {
//        do {
//            let realmObjects = realm.objects(PresentedAnswer.self).sorted(byKeyPath: PresentedAnswer.Property.date.rawValue, ascending: false)
//            return realmObjects
//        } catch let error as NSError {
//            print(error)
//        }
//    }
}
