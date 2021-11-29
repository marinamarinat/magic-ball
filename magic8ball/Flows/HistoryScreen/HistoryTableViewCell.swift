//
//  HistoryTableViewCell.swift
//  MAGIC 8 BALL
//
//  Created by Marina Tsesarenko on 29.11.2021.
//

import UIKit
import SnapKit

class HistoryTableViewCell: UITableViewCell {
    static let identifier = "HistoryTableViewCell"
    private let historyAnswerLabel: UILabel = {
        let labelAnswer = UILabel()
        labelAnswer.textColor = .black
        labelAnswer.font = .systemFont(ofSize: 15.0, weight: .medium)
        labelAnswer.numberOfLines = 0
        return labelAnswer
    }()
    private let historyTimeLabel: UILabel = {
        let labelTime = UILabel()
        labelTime.textColor = .black
        labelTime.font = .systemFont(ofSize: 13.0, weight: .medium)
        labelTime.textAlignment = .right
        labelTime.numberOfLines = 0
        return labelTime
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(historyAnswerLabel)
        contentView.addSubview(historyTimeLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(history: String, data: String) {
        historyAnswerLabel.text = history
        historyTimeLabel.text = data
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        historyAnswerLabel.text = nil
        historyTimeLabel.text = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        customSizeAnswerLabel(label: historyAnswerLabel)
        customSizeDataLabel(data: historyTimeLabel)
    }
}

extension HistoryTableViewCell {
    func customSizeAnswerLabel(label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: 15).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    func customSizeDataLabel(data: UILabel) {
        data.translatesAutoresizingMaskIntoConstraints = false
        data.leftAnchor.constraint(equalTo: historyAnswerLabel.rightAnchor, constant: 10).isActive = true
        data.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        data.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
