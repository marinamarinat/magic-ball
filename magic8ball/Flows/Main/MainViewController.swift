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
    private let answersLabel = UILabel()
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
        configureRightBarItem()
        configureLeftBarItem()
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
                self.answersLabel.text = answer?.maxLength(length: 30)
            }
            viewModel.saveToHistory(self.answersLabel.text ?? "error!")
        }
    }
    @objc func settingsButton(_ sender: Any) {
        let settingsVC = SettingsViewController(viewModel: viewModel.getSettingsViewModel())
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    @objc func historyButton(_ sender: Any) {
        let historyVC = HistoryScreenViewController(viewModel: viewModel.getHistoryViewModel())
        navigationController?.pushViewController(historyVC, animated: true)
    }
}

// MARK: - UI
extension MainViewController {
    private func configureRightBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: L10n.gearshapeImage),
            style: .done,
            target: self,
            action: #selector(self.settingsButton(_:))
        )
    }
    private func configureLeftBarItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "h.circle.fill"),
            style: .done,
            target: self,
            action: #selector(self.historyButton(_:))
        )
    }
    private func setupUI() {
        ballImage.contentMode = .scaleAspectFill
        ballImage.image = UIImage(named: "magic8ball")
        view.addSubview(ballImage)
        ballImage.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.height.equalTo(250)
        }
        view.backgroundColor = .white
        answersLabel.numberOfLines = 0
        answersLabel.textAlignment = .center
        answersLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(answersLabel)
        answersLabel.snp.makeConstraints { make in
            make.top.equalTo(ballImage).offset(-100)
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }
}
extension String {
   func maxLength(length: Int) -> String {
       var str = self
       let nsString = str as NSString
       if nsString.length >= length {
           str = nsString.substring(with:
               NSRange(
                location: 0,
                length: nsString.length > length ? length : nsString.length)
           )
       }
       return  str
   }
}
