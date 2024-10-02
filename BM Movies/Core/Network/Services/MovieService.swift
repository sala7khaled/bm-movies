//
//  UsersService.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

extension Api {
    
    enum MovieService: ServiceProtocol {
        
        case getNowPlaying(language: String, page: Int)
        
        var path: String {
            switch self {
            case .getNowPlaying:
                return API.SERVICE_POPULAR
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getNowPlaying:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case let .getNowPlaying(language, page):
                return ["language": language,
                        "page": page]
            }
        }
        
        var headers: Headers? {
            switch self {
            case .getNowPlaying:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .getNowPlaying:
                return nil
            }
        }
    }
    
}
