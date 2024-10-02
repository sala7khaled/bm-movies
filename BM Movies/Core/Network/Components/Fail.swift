//
//  Fail.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

struct Fail: Codable {
    
    let success: Bool?
    let statusCode: Int?
    let statusMessage: String?
}

extension Fail {
    
    enum CodingKeys: String, CodingKey {
        
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
        
    }
}
