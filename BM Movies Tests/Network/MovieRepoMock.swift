//
//  MovieRepoMock.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import XCTest
@testable import BM_Movies

class MovieRepoMock: MovieRepoInterface {
    
    var isSuccess: Bool = true
    
    func getMovieDetail(movieId: Int, _ completion: @escaping (APIResponse<MovieDetailModel>) -> ()) {
        if isSuccess {
            let data = JsonLoader<MovieDetailModel>().get(.get_movie_detail)
            completion(.onSuccess(data!))
        } else {
            completion(.onFailure(.init(type: .network)))
        }
    }
}
