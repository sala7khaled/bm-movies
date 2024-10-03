//
//  HomeRepo.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

// MARK: - Protocol
public protocol HomeRepoInterface {
    func getNowPlaying(language: String, page: Int, _ completion: @escaping (APIResponse<APIData<[MovieModel]>>) -> ())
    func getPopular(language: String, page: Int, _ completion: @escaping (APIResponse<APIData<[MovieModel]>>) -> ())
    func getUpcoming(language: String, page: Int, _ completion: @escaping (APIResponse<APIData<[MovieModel]>>) -> ())
}

// MARK: - Repo
public class HomeRepo: Repo, HomeRepoInterface {
    
    static let shared = HomeRepo()
    
    // MARK: - Network
    public func getNowPlaying(language: String, page: Int, _ completion: @escaping (APIResponse<APIData<[MovieModel]>>) -> ()) {
        provider.request(type: APIData<[MovieModel]>.self, service: Api.MovieService.getNowPlaying(language: language, page: page)) { response in
            switch (response) {
            case let .onSuccess(response):
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
    
    public func getPopular(language: String, page: Int, _ completion: @escaping (APIResponse<APIData<[MovieModel]>>) -> ()) {
        provider.request(type: APIData<[MovieModel]>.self, service: Api.MovieService.getPopular(language: language, page: page)) { response in
            switch (response) {
            case let .onSuccess(response):
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
    
    public func getUpcoming(language: String, page: Int, _ completion: @escaping (APIResponse<APIData<[MovieModel]>>) -> ()) {
        provider.request(type: APIData<[MovieModel]>.self, service: Api.MovieService.getUpcoming(language: language, page: page)) { response in
            switch (response) {
            case let .onSuccess(response):
                completion(.onSuccess(response))
            case let .onFailure(error):
                completion(.onFailure(error))
            }
        }
    }
}
