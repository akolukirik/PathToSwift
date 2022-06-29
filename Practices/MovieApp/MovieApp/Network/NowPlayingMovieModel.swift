//
//  NowPlayingMovieModel.swift
//  MovieApp
//
//  Created by ali on 27.06.2022.
//

import Foundation
import Alamofire

struct NowPlayingMovieModel: Codable {
    let results: [NowPlayingMovieModelResult]?

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct NowPlayingMovieModelResult: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case title = "title"
        case posterPath = "poster_path"
    }
}


extension ViewController {

    func getNowPlayingData() {
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=62e3f1018136eaf84ab9ef75fafaf678&language=en-US&page=1"

        AF.request(url,
                   method: .get).responseDecodable(of: NowPlayingMovieModel.self) { [weak self] response in
            if let npModel = response.value {
                self?.nowPlayingMovieList = npModel.results ?? []
                self?.collectionView.reloadData()
            }
        }
    }

}


