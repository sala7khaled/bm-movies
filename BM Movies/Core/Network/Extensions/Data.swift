//
//  Data.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

extension Data {
    
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) { append(data) }
    }
}
