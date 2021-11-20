//
//  SettingsViewController.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 17.10.2021.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    let viewModel: SettingsViewModel    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError(L10n.Error.initCoder)
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
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(showAddAnswerAlert))
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
extension SettingsViewController {
    func setupUI() {
        title = L10n.SettingsViewController.title
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
