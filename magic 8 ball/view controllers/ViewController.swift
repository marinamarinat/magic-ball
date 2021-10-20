//
//  ViewController.swift
//  magic 8 ball
//
//  Created by Marina Tsesarenko on 10.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let networkService = NetworkService()
    
    @IBOutlet weak var answersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answersLabel.text = "Ask the question and shake your phone!"
        becomeFirstResponder()
        configureBarItem()
    }
 
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            displayAnswer()
        }
    }
    
    private func displayAnswer() {
        if SettingsViewController.answers.count >= 2 {
            self.displayLocalAnswer()
            return
        }
        self.displayNetworkAnswer()
    }
    
    private func displayLocalAnswer() {
        answersLabel.text = SettingsViewController.answers.randomElement()
    }
    
    private func displayNetworkAnswer() {
        let urlString = "https://8ball.delegator.com/magic/JSON/%3Cquestion_string%3E"
        networkService.request(urlString: urlString) { [self] (magic, error) in
            let answer1 = magic?.magic.answer
            answersLabel.text = answer1
        }
    }
    
    private func configureBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape.fill"),
            style: .done,
            target: self,
            action: #selector(self.settingsButton(_:))
        )
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        let settingsVC = storyboard?.instantiateViewController(identifier: "settings") as! SettingsViewController
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
}

