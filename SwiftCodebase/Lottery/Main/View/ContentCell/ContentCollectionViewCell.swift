//
//  ContentCollectionViewCell.swift
//  SevenTvUser
//
//  Created by Abi M on 10/8/23.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {


    func configure(title: String, sideMenu: SideMenuEnum) {

        switch sideMenu {
            
        case .menu1:
            setupUI()
        default:
            return
        }
    }

    func setupUI() {
        let contentStackView = UIStackView()
        self.contentView.addSubview(contentStackView)
        contentStackView.axis = .horizontal
        contentStackView.spacing = 5
        contentStackView.distribution = .fillProportionally
        contentStackView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(self.frame.width - 10)
            make.center.equalToSuperview()
        }

        let roundedLabel = RoundedLabel(size: CGSize(width: 30, height: 30), color: .red)
        roundedLabel.regularFont(size: 14)
        roundedLabel.text = "0头"
        roundedLabel.textColor = .black
        roundedLabel.textAlignment = .center

        let textLabel = UILabel()
        textLabel.text = "48.0"
        textLabel.regularFont(size: 14)
        textLabel.textColor = .red
        textLabel.textAlignment = .center

        contentStackView.addArrangedSubview(roundedLabel)
        contentStackView.addArrangedSubview(textLabel)
    }
}
