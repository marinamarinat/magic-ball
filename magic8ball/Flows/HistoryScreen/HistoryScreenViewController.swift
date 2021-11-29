//
//  HistoryScreenViewController.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 29.11.2021.
//

import UIKit
import SnapKit

class HistoryScreenViewController: UIViewController {
    let viewModel: HistoryScreenViewModel
    init(viewModel: HistoryScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError(L10n.Error.initCoder)
    }
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupUI()
        viewModel.loadInfo()
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//    }
    func setupUI() {
        title = "History"
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension HistoryScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let answer = viewModel.message(for: indexPath.row)
//        let cell = UITableViewCell()
//        cell.textLabel?.text = answer
//        return cell
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier,
                                                       for: indexPath) as? HistoryTableViewCell else {
                                                        return UITableViewCell()}
        cell.configure(history: viewModel.message(for: indexPath.row),
                       data: viewModel.dateString(for: indexPath.row))
        self.tableView.reloadData()
        return cell
    }
}
