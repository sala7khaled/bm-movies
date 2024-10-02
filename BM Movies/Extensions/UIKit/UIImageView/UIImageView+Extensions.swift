//
//  UIImage+Extensions.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

extension UIImageView {
    
    func loadImage(url: String?) {
        NETWORK.loadImage(from: APIKeys.imageBaseUrl + (url ?? "")) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
    
    func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
        
    }
    
}
