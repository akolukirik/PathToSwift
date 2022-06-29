//
//  UpcomingModel.swift
//  MovieApp
//
//  Created by ali on 22.06.2022.
//

import Foundation
import Alamofire

// MARK: - Welcome
struct UpcomingMovieModel: Codable {
    var page: Int?
    var results: [UpcomingMovieResult]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


// MARK: - Result
struct UpcomingMovieResult: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate, title: String?
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


extension ViewController  {
    
    func getData() {
        let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=62e3f1018136eaf84ab9ef75fafaf678&language=en-US&page=1"

        AF.request(url,
                   method: .get).responseDecodable(of: UpcomingMovieModel.self) { [weak self] response in
            if let model = response.value {
                self?.upcomingMovieList = model.results ?? []
                self?.tableView.reloadData()
            }
        }
    }
}
