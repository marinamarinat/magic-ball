//
//  ViewController.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 10.10.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private let ballImage = UIImageView()
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
        let settingsVC = SettingsViewController(viewModel: viewModel.getSettingsViewModel())
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    public lazy var answersLabel: UILabel = {
        let answerslabel = UILabel()
        answerslabel.numberOfLines = 0
        answerslabel.textAlignment = .center
        answerslabel.font = UIFont.boldSystemFont(ofSize: 20)
        return answerslabel
    }()
}

// MARK: - UI
extension MainViewController {
    private func configureBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: L10n.gearshapeImage),
            style: .done,
            target: self,
            action: #selector(self.settingsButton(_:))
        )
    }
    private func setupUI() {
        ballImage.contentMode = .scaleAspectFill
        ballImage.image = UIImage(named: "magic8ball")
        view.addSubview(ballImage)
        ballImage.snp.makeConstraints { make in
            make.centerY.equalTo(self.view)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(250)
        }
        view.backgroundColor = .white
        view.addSubview(answersLabel)
        answersLabel.snp.makeConstraints { make in
            make.top.equalTo(ballImage).offset(-100)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}
