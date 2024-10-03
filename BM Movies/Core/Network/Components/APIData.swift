//
//  APIData.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

/// The generic response for current API
public struct APIData<T: Decodable>: Decodable {
    
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    var results: T?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
}
