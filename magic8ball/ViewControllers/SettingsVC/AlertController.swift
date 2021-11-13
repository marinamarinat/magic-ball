//
//  AlertController.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 09.11.2021.
//

import UIKit

extension SettingsViewController {
    @objc func showAddAnswerAlert() {
        let alert = UIAlertController(title: L10n.Alert.title, message: L10n.Alert.message, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = L10n.TextField.placeholder
        }
        let addAction = UIAlertAction(title: L10n.AddAction.title, style: .default) { _ in
            guard let textField = alert.textFields?.first else { return }
            guard let text = textField.text else { return }
            guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
            self.addAnswer(answer: text)
        }
        let cancelAction = UIAlertAction(title: L10n.CancelAction.title, style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
}
