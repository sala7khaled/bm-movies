//
//  UsersRepo.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class MovieRepo: Repo {
    
    static let shared = MovieRepo()
    
    // MARK: - Network
    func getNowPlaying(language: String, page: Int, _ completion: @escaping (APIResponse<APIData<[MovieModel]>>) -> ()) {
        provider.request(type: APIData<[MovieModel]>.self, service: Api.MovieService.getNowPlaying(language: language, page: page)) { response in
            switch (response) {
            case let .onSuccess(response):
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }

}
