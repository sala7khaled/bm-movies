//
//  HomeViewModelTests.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import XCTest
@testable import BM_Movies

class HomeViewModelTests: XCTestCase {
    
    // MARK: - Properties
    private let homeRepo = HomeRepoMock()
    private let language: String = "en-US"
    private let page: Int = 1

    
    // MARK: - Test Cases (Now Playing)
    func test_getNowPlayingAPI_success() {
        homeRepo.isSuccess = true
        homeRepo.getNowPlaying(language: language, page: page) { response in
            switch response {
            case let .onSuccess(movieList):
                XCTAssert(movieList.page == self.page)
            case .onFailure:
                XCTFail()
            }
        }
    }
    
    func test_getNowPlayingAPI_failed() {
        homeRepo.isSuccess = false
        homeRepo.getNowPlaying(language: language, page: page) { response in
            switch response {
            case .onSuccess:
                XCTFail()
            case let .onFailure(error):
                XCTAssert(error.type == .network)
            }
        }
    }
    
    // MARK: - Test Cases (Popular)
    func test_getPopularAPI_success() {
        homeRepo.isSuccess = true
        homeRepo.getPopular(language: language, page: page) { response in
            switch response {
            case let .onSuccess(movieList):
                XCTAssert(movieList.page == self.page)
            case .onFailure:
                XCTFail()
            }
        }
    }
    
    func test_getPopularAPI_failed() {
        homeRepo.isSuccess = false
        homeRepo.getPopular(language: language, page: page) { response in
            switch response {
            case .onSuccess:
                XCTFail()
            case let .onFailure(error):
                XCTAssert(error.type == .network)
            }
        }
    }
    
    // MARK: - Test Cases (Upcoming)
    func test_getUpcomingAPI_success() {
        homeRepo.isSuccess = true
        homeRepo.getUpcoming(language: language, page: page) { response in
            switch response {
            case let .onSuccess(movieList):
                XCTAssert(movieList.page == self.page)
            case .onFailure:
                XCTFail()
            }
        }
    }
    
    func test_getUpcomingAPI_failed() {
        homeRepo.isSuccess = false
        homeRepo.getUpcoming(language: language, page: page) { response in
            switch response {
            case .onSuccess:
                XCTFail()
            case let .onFailure(error):
                XCTAssert(error.type == .network)
            }
        }
    }
}
