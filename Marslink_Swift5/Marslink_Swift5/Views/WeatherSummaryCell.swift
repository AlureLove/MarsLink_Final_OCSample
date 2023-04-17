//
//  WeatherSummaryCell.swift
//  Marslink_Swift5
//
//  Created by liuruixuan on 2023/4/17.
//

import UIKit

class WeatherSummaryCell: UICollectionViewCell {
    private let expandLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = AppFont(size: 30)
        label.textColor = UIColor(hex6: 0x44758B)
        label.textAlignment = .center
        label.text = ">>"
        label.sizeToFit()
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        let subtitleAttributes = [
            NSAttributedString.Key.font: AppFont(size: 14),
            NSAttributedString.Key.foregroundColor: UIColor(hex6: 0x42C84B),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        let titleAttributes = [
            NSAttributedString.Key.font: AppFont(size: 24),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        let attributedText = NSMutableAttributedString(string: "LATEST\n", attributes: subtitleAttributes)
        attributedText.append(NSAttributedString(string: "WEATHER", attributes: titleAttributes))
        label.attributedText = attributedText
        label.sizeToFit()

        return label
    }()

    func setExpanded(_ expanded: Bool) {
        expandLabel.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi / 2) : CGAffineTransform.identity
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(expandLabel)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = UIColor(hex6: 0x0C1F3F)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = CommonInsets
        titleLabel.frame = CGRect(x: insets.left, y: 0, width: titleLabel.bounds.width, height: bounds.height)
        expandLabel.center = CGPoint(x: bounds.width - expandLabel.bounds.width / 2 - insets.right, y: bounds.height / 2)
    }
}
