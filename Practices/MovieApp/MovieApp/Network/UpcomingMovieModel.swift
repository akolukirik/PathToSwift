//
//  UpcomingModel.swift
//  MovieApp
//
//  Created by ali on 22.06.2022.
//

import Foundation

struct UpcomingMovieModel: Codable {
    var dates: Dates?
    var page: Int?
    var results: [UpcomingMovieModelResults]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Dates
struct Dates: Codable {
    var maximum, minimum: String?
}

// MARK: - Result
struct UpcomingMovieModelResults: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: OriginalLanguage?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case zh = "zh"
}
