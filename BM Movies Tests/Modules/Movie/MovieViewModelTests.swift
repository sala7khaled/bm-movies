//
//  MovieViewModelTests.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import XCTest
@testable import BM_Movies

class MovieViewModelTests: XCTestCase {
    
    // MARK: - Properties
    private let movieRepo = MovieRepoMock()
    private let movieId: Int = 957452

    
    // MARK: - Test Cases
    func test_getMovieDetailAPI_success() {
        movieRepo.isSuccess = true
        movieRepo.getMovieDetail(movieId: movieId) { response in
            switch response {
            case let .onSuccess(movie):
                XCTAssert(movie.id == self.movieId)
            case .onFailure:
                XCTFail()
            }
        }
    }
    
    func test_getMovieDetailAPI_failed() {
        movieRepo.isSuccess = false
        movieRepo.getMovieDetail(movieId: movieId) { response in
            switch response {
            case .onSuccess:
                XCTFail()
            case let .onFailure(error):
                XCTAssert(error.type == .network)
            }
        }
    }
}
