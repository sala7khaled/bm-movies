//
//  DetailService.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import Foundation

extension Api {
    
    enum DetailService: ServiceProtocol {
        
        case getMovieDetail(movieId: Int)
        
        var path: String {
            switch self {
            case .getMovieDetail(let movieId):
                return API.SERVICE_MOVIE_DETAIL + "\(movieId)"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getMovieDetail:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .getMovieDetail:
                return nil
            }
        }
        
        var headers: Headers? {
            switch self {
            case .getMovieDetail:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .getMovieDetail:
                return nil
            }
        }
    }
    
}
