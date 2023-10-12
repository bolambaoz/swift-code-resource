//
//  UINavigationBar+Extension.swift
//  SevenTvUser
//
//  Created by pobringuyamot on 10/10/23.
//

import Foundation

extension UINavigationBar {
    static let defaultBackgroundColor = UIColor.red
    static let defaultTintColor = UIColor.white
    
    func setTranslucent(tintColor: UIColor, titleColor: UIColor) {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.titleTextAttributes = [.foregroundColor: titleColor]
        
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            compactAppearance = appearance
            compactScrollEdgeAppearance = appearance
        } else {
            titleTextAttributes = [.foregroundColor: titleColor]
            setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            shadowImage = UIImage()
        }
        isTranslucent = true
        self.barTintColor = tintColor
        self.tintColor = tintColor
    }
    
    func setDefaultState() {
        isTranslucent = false
        clipsToBounds = false
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UINavigationBar.defaultBackgroundColor
            appearance.titleTextAttributes = [.foregroundColor: UINavigationBar.defaultTintColor]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.defaultPrompt)
            shadowImage = UIImage()
            barTintColor = UINavigationBar.defaultBackgroundColor
            titleTextAttributes = [.foregroundColor: UINavigationBar.defaultTintColor]
        }
        
        tintColor = UINavigationBar.defaultTintColor
    }
}
