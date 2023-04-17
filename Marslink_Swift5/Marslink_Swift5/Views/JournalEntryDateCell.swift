//
//  JournalEntryDateCell.swift
//  Marslink_Swift5
//
//  Created by liuruixuan on 2023/4/17.
//

import UIKit

class JournalEntryDateCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = AppFont(size: 14)
        label.textColor = UIColor(hex6: 0x42C84B)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(hex6: 0x0C1F3F)
        contentView.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let padding = CommonInsets
        label.frame = bounds.inset(by: UIEdgeInsets(top: 0, left: padding.left, bottom: 0, right: padding.right))
    }
}
