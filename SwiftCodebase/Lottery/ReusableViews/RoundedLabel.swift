//
//  RoundedLabel.swift
//  SevenTvUser
//
//  Created by Abi M on 10/11/23.
//

import Foundation

// MARK: Props/Overrides
class RoundedLabel: UILabel {

    public private(set) var color: UIColor

    init(size: CGSize, color: UIColor) {
        self.color = color

        super.init(frame: CGRect(x: .zero, y: .zero, width: size.width, height: size.height))
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: FUnctionalities
extension RoundedLabel {
    private func setupView() {
        self.backgroundColor = color
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
    }
}
