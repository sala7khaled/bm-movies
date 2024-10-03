//
//  MovieViewModel.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import UIKit

class MovieViewModel {
    
    // MARK: - Properties
    private var movieId: Int
    
    
    // MARK: - Life Cycle
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    // MARK: - Closures
    var didFailedDetailClosure: ((String) -> Void)?
    var didSuccessDetailClosure: (() -> Void)?
    
    
    // MARK: - Methods
    func getMovieDetailAPI() {
        
        DetailRepo.shared.getMovieDetail(movieId: movieId) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case let .onSuccess(response):
//                    self.moviesList = response.results ?? []
                    self.didSuccessDetailClosure?()
                case let .onFailure(error):
                    self.didFailedDetailClosure?(error.message ?? "no_response_found".l())
                }
            }
        }
    }
    
    
}
