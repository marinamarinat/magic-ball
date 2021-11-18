//
//  SettingsViewController.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 17.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    let viewModel: SettingsViewModel    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .clear
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.SettingsViewController.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddAnswerAlert))
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }

}

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
            self.viewModel.addAnswerToDB(text)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: L10n.CancelAction.title, style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true, completion: nil)
    }
}
