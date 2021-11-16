//
//  ViewController.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 10.10.2021.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel: MainViewModel
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(L10n.Error.initCoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureBarItem()
        navigationController?.navigationBar.tintColor = .label
        answersLabel.text = L10n.ShakeMessage.title
        becomeFirstResponder()
    }
    override var canBecomeFirstResponder: Bool {
        return true
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            viewModel.displayAnswer {(answer) in
                self.answersLabel.text = answer
            }
        }
    }

    @objc func settingsButton(_ sender: Any) {
         let settingsVC = SettingsViewController()
         navigationController?.pushViewController(settingsVC, animated: true)
     }
    // MARK: - UI
    private func configureBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: L10n.gearshapeImage),
            style: .done,
            target: self,
            action: #selector(self.settingsButton(_:))
        )
    }

    public lazy var answersLabel: UILabel = {
        let answerslabel = UILabel()
        answerslabel.numberOfLines = 0
        answerslabel.textAlignment = .center
        answerslabel.font = UIFont.boldSystemFont(ofSize: 20)
        return answerslabel
    }()
    private func setupUI() {
        view.backgroundColor = .white
        let offset = UIScreen.main.bounds.size.height * 0.20
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(answersLabel)
        answersLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -offset).isActive = true
        answersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        answersLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
