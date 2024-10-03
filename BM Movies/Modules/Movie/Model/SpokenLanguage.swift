//
//  SpokenLanguage.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import Foundation

class SpokenLanguageModel: Codable {
    
    let englishName: String?
    let iso639_1: String?
    let name: String?
    
}

extension SpokenLanguageModel {
    
    enum CodingKeys: String, CodingKey {
        
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}
