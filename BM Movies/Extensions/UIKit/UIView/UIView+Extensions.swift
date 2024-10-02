//
//  UIView+Extensions.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

extension UIView {
    
    func setRadius(_ radius: CGFloat? = nil) {
        
        if let radius = radius {
            layer.cornerRadius = radius
            clipsToBounds = true
        } else {
            oval()
        }
    }
    
    func setBorder (width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func oval() {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
    
}
