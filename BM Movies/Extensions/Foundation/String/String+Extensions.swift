//
//  String+Extensions.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

extension String {
    
    func l() -> String {
        return Bundle.main.localizedString(forKey: self, value: "", table: nil)
    }
    
}
