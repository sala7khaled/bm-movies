//
//  MovieModel.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

public class MovieModel: Codable {

    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?
    let voteCount: Int?

}

public extension MovieModel {

    enum CodingKeys: String, CodingKey {
        
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"

    }
}
