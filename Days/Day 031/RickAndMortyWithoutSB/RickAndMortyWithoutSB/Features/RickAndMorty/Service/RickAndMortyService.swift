//
//  RickAndMortyService.swift
//  RickAndMortyWithoutSB
//
//  Created by ali on 10.07.2022.
//

import Foundation
import Alamofire

enum RickAndMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"

    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickAndMortyService {

    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct RickyAndMortyService: IRickAndMortyService {

    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickAndMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }

}
