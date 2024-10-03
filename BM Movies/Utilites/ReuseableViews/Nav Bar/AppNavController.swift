//
//  AppNavController.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class AppNavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        navigationBar.tintColor = .appWhite
        navigationBar.barTintColor = .appBlack
        
        let font = UIFont.boldSystemFont(ofSize: 18)
        let largeFont = UIFont.boldSystemFont(ofSize: 38)
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.appWhite,
            NSAttributedString.Key.font: font
        ]
        
        navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.appWhite,
            NSAttributedString.Key.font: largeFont
        ]
        
        navigationBar.prefersLargeTitles = true
        navigationBar.layoutIfNeeded()
    }
}
