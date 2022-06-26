//
//  NowPlayingMovieModel.swift
//  MovieApp
//
//  Created by ali on 26.06.2022.
//

import Foundation

struct NowPlayingMovieModel: Codable {
    var dates: DatesNp?
    var page: Int?
    var results: [NowPlayingMovieResults]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct DatesNp: Codable {
    var maximum, minimum: String?
}

// MARK: - Result
struct NowPlayingMovieResults: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: OriginalLanguageNp?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguageNp: String, Codable {
    case en = "en"
    case ja = "ja"
}
