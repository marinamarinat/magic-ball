//
//  AlertController.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 09.11.2021.
//

import UIKit

extension SettingsViewController {
    @objc func showAddAnswerAlert() {
        let alert = UIAlertController(title: "", message: "Add custom answer", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Answer"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let textField = alert.textFields?.first else { return }
            guard let text = textField.text else { return }
            guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
            self.addAnswer(answer: text)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
}
