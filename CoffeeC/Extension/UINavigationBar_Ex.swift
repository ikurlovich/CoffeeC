//
//  UINavigationBar_Ex.swift
//  CoffeeC
//
//  Created by Илья Курлович on 09.02.2024.
//

import SwiftUI

extension UINavigationBar {
    static func customize() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.backToolBar
        
        appearance.largeTitleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.accent
        ]
        
        appearance.titleTextAttributes = [
            .font : UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.accent
        ]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        UINavigationBar.appearance().tintColor = .accent
    }
}
