//
//  GenreModel.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import Foundation

class GenreModel: Codable {
    
    let id: Int?
    let name: String?
    
}

extension GenreModel {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
    }
}
