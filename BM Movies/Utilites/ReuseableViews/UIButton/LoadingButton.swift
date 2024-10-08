//
//  LoadingButton.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class LoadingButton: UIButton {
    
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    
    func configure(radius: CGFloat = 12,
                   textColor: UIColor = .appWhite,
                   backColor: UIColor = .appPrimary,
                   borderColor: UIColor? = nil) {
        
        self.applyShadow()
        layer.cornerRadius = radius
        setTitleColor(textColor, for: .normal)
        backgroundColor = backColor
        
        if let borderColor = borderColor {
            layer.borderWidth = 1.5
            layer.borderColor = borderColor.cgColor
        }
        
    }
    
    func showLoading() {
        isEnabled = false
        originalButtonText = self.titleLabel?.text
        setTitle("", for: .normal)
        
        if activityIndicator == nil {
            activityIndicator = createActivityIndicator()
        }
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        if activityIndicator != nil && activityIndicator.isAnimating {
            isEnabled = true
            setTitle(originalButtonText, for: .normal)
            
            if activityIndicator.isAnimating {
                activityIndicator.stopAnimating()
            }
        }
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .appWhite
        return activityIndicator
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
