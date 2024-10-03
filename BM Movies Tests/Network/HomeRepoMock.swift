//
//  HomeRepoMock.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import XCTest
@testable import BM_Movies

class HomeRepoMock: HomeRepoInterface {
    
    var isSuccess: Bool = true
    
    
    func getNowPlaying(language: String, page: Int, _ completion: @escaping (BM_Movies.APIResponse<BM_Movies.APIData<[BM_Movies.MovieModel]>>) -> ()) {
        if isSuccess {
            let data = JsonLoader<APIData<[MovieModel]>>().get(.get_movie_list)
            completion(.onSuccess(data!))
        } else {
            completion(.onFailure(.init(type: .network)))
        }
    }
    
    func getPopular(language: String, page: Int, _ completion: @escaping (BM_Movies.APIResponse<BM_Movies.APIData<[BM_Movies.MovieModel]>>) -> ()) {
        if isSuccess {
            let data = JsonLoader<APIData<[MovieModel]>>().get(.get_movie_list)
            completion(.onSuccess(data!))
        } else {
            completion(.onFailure(.init(type: .network)))
        }
    }
    
    func getUpcoming(language: String, page: Int, _ completion: @escaping (BM_Movies.APIResponse<BM_Movies.APIData<[BM_Movies.MovieModel]>>) -> ()) {
        if isSuccess {
            let data = JsonLoader<APIData<[MovieModel]>>().get(.get_movie_list)
            completion(.onSuccess(data!))
        } else {
            completion(.onFailure(.init(type: .network)))
        }
    }
}
