//
//  APIError.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

public enum APIErrorType {

    case server
    case noData
    case parsing
    case string
    case network
    case known
}

public struct APIError {
    
    var type: APIErrorType
    var code: Int? = 0
    var message: String?
}
