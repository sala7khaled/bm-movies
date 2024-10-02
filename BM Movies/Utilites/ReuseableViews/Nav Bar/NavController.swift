//
//  NavController.swift
//  Bosta Gallery
//
//  Created by Salah Khaled on 02/02/2023.
//  Copyright © 2023 Salah Khaled. All rights reserved.
//

import UIKit

class NavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        navigationBar.tintColor = .appBlack
        navigationBar.barTintColor = .appWhite
        
        let font = UIFont.boldSystemFont(ofSize: 24)
        let largeFont = UIFont.boldSystemFont(ofSize: 38)
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: font
        ]
        
        navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: largeFont
        ]
        
//        navigationBar.backIndicatorImage = UIImage(named: Images.back)
//        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Images.back)
        
        navigationBar.prefersLargeTitles = true
        navigationBar.layoutIfNeeded()
    }
}
