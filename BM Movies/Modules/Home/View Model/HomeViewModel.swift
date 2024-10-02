//
//  HomeViewModel.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class HomeViewModel {
    
    // MARK: - Closures
    var didFailedMoviesClosure: ((String) -> Void)?
    var didSuccessMoviesClosure: (() -> Void)?
    
    // MARK: - Properties
    private var moviesList: [MovieModel] = []
    
    
    // MARK: - Methods
    func getMovieAt(index: Int) -> MovieModel {
        return moviesList[index]
    }
    
    func getMovieCount() -> Int {
        return moviesList.count
    }
    
    // MARK: - API
    func getMoviesAPI() {
        MovieRepo.shared.getNowPlaying(language: "en", page: 1) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case let .onSuccess(response):
                    self.moviesList = response.results ?? []
                    self.didSuccessMoviesClosure?()
                case let .onFailure(error):
                    self.didFailedMoviesClosure?(error.message ?? "no_response_found".l())
                }
            }
        }
    }
    
}

