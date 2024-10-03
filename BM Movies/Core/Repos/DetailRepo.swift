//
//  DetailRepo.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import UIKit

class DetailRepo: Repo {
    
    static let shared = DetailRepo()
    
    // MARK: - Network
    func getMovieDetail(movieId: Int, _ completion: @escaping (APIResponse<MovieDetailModel>) -> ()) {
        provider.request(type: MovieDetailModel.self, service: Api.DetailService.getMovieDetail(movieId: movieId)) { response in
            switch (response) {
            case let .onSuccess(response):
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
    
}
