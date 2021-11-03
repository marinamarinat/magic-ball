//
//  SettingsViewController.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 17.10.2021.
//

import UIKit
import RealmSwift
// TO DO: Connect custom user answers to the Realm database.

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    static var answers:[String] = []
    
    private lazy var tableView:UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .clear
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddAnswerAlert))
    }
    
    private func addAnswer(answer:String) {
        SettingsViewController.answers.append(answer)
        self.tableView.reloadData()
    }
    
    // MARK: - Alert Controller set up
    @objc private func showAddAnswerAlert() {
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
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Table View set up
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsViewController.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = SettingsViewController.answers[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = answer
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            SettingsViewController.answers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
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
