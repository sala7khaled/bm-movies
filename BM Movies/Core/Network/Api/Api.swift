//
//  Api.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

/**
 APIConfigurations
 
 - parameter development: For the application during the development phase.
 - parameter stage: For the application during the testing phase.
 - parameter production: For the application during the launching on App store.
 */

let API = Api(config: .development)

enum APIConfiguration {

    case development
    case stage
    case production
}

final class Api {
    
    let config: APIConfiguration
    
    var baseUrl: String {
        switch config {
        case .development:
            return APIKeys.developmentBaseUrl
        case .stage:
            return APIKeys.stageBaseUrl
        case .production:
            return APIKeys.productionBaseUrl
        }
    }
    
    init(config: APIConfiguration) {
        self.config = config
    }
     
    // MARK: - HOME
    let SERVICE_NOW_PLAYING = "now_playing"
    let SERVICE_POPULAR = "popular"
    let SERVICE_UPCOMING = "upcoming"
    
    
}
