//
//  UILabel+Extension.swift
//  SevenTvUser
//
//  Created by Abi M on 10/9/23.
//

import Foundation

extension UILabel {
    func regularFont(size: CGFloat) {
        self.font = UIFont(name: "PingFangSC-Regular", size: size)
    }

    func mediumFont(size: CGFloat) {
        self.font = UIFont(name: "PingFangSC-Medium", size: size)
    }

    func boldFont(size: CGFloat) {
        self.font = UIFont(name: "PingFangSC-Semibold", size: size)
    }
}
