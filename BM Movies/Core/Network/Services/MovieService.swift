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
        case getPopular(language: String, page: Int)
        case getUpcoming(language: String, page: Int)
        
        var path: String {
            switch self {
            case .getNowPlaying:
                return API.SERVICE_NOW_PLAYING
            case .getPopular:
                return API.SERVICE_POPULAR
            case .getUpcoming:
                return API.SERVICE_UPCOMING
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getNowPlaying, .getPopular, .getUpcoming:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case let .getNowPlaying(language, page):
                return ["language": language,
                        "page": page]
            case let .getPopular(language, page):
                return ["language": language,
                        "page": page]
            case let .getUpcoming(language, page):
                return ["language": language,
                        "page": page]
            }
        }
        
        var headers: Headers? {
            switch self {
            case .getNowPlaying, .getPopular, .getUpcoming:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .getNowPlaying, .getPopular, .getUpcoming:
                return nil
            }
        }
    }
    
}
