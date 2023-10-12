//
//  SideMenuTableViewCell.swift
//  SevenTvUser
//
//  Created by Abi M on 10/8/23.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    let identifier = "SideMenuTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.selectedBackgroundView = createViewForSelectedCell()
        self.selectionStyle = .default
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(title: String) {
        self.backgroundColor = UIColor(hexString: "##F4F5FA")

        let label = UILabel()
        self.addSubview(label)
        label.text = title
        label.regularFont(size: 14)
        label.textColor = UIColor(hexString: "#777777")
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    private func createViewForSelectedCell() -> UIView {
        let bgView = UIView()

        let verticalLine = UIView(frame: CGRect(x: .zero, y: .zero, width: 5.0, height: self.frame.height))
        verticalLine.backgroundColor = UIColor(hexString: "#8075EF")

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPointMake(0.0, 0.5)
        gradientLayer.endPoint = CGPointMake(1.0, 0.5)
        gradientLayer.colors = [UIColor(hexString: "#CEC9FF").withAlphaComponent(1.0).cgColor, UIColor(hexString: "#CEC9FF").withAlphaComponent(0.0).cgColor];
        bgView.layer.addSublayer(gradientLayer)
        bgView.addSubview(verticalLine)

        return bgView
    }
}
