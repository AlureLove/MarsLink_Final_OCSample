//
//  WeatherDetailCell.swift
//  Marslink_Swift5
//
//  Created by liuruixuan on 2023/4/17.
//

import UIKit

class WeatherDetailCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = AppFont()
        label.textColor = UIColor(hex6: 0x42C84B)
        return label
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = AppFont()
        label.textColor = UIColor(hex6: 0x42C84B)
        label.textAlignment = .right
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        contentView.backgroundColor = UIColor(hex6: 0x0C1F3F)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let insetBounds = bounds.inset(by: CommonInsets)
        titleLabel.frame = insetBounds
        detailLabel.frame = insetBounds
    }
}
