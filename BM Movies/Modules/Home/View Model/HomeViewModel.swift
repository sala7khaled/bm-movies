//
//  HomeViewModel.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class HomeViewModel {
    
    // MARK: - Properties
    private var homeType: HomeTabType
    private var moviesList: [MovieModel] = []
    
    
    // MARK: - Life Cycle
    init(homeType: HomeTabType) {
        self.homeType = homeType
    }
    
    // MARK: - Closures
    var didFailedMoviesClosure: ((String) -> Void)?
    var didSuccessMoviesClosure: (() -> Void)?
    var startLoadingClosure: (() -> Void)?
    
    
    // MARK: - Methods
    func getMovieAt(index: Int) -> MovieModel {
        return moviesList[index]
    }
    
    func getMovieCount() -> Int {
        return moviesList.count
    }
    
    // MARK: - API
    func getMoviesAPI() {
        startLoadingClosure?()
        
        let completionHandler: (APIResponse<APIData<[MovieModel]>>) -> Void = { [weak self] response in
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
        
        let langCode = AppLanguage.currentLanguage()
        let page = 1
        
        
        switch homeType {
        case .nowPlaying:
            MovieRepo.shared.getNowPlaying(language: langCode, page: page, completionHandler)
        case .popular:
            MovieRepo.shared.getPopular(language: langCode, page: page, completionHandler)
        case .upcoming:
            MovieRepo.shared.getUpcoming(language: langCode, page: page, completionHandler)
        }
    }

    
}

