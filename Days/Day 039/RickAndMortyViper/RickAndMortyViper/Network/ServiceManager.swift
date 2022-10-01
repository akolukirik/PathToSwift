//
//  Service.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 1.10.2022.
//

import Alamofire

protocol ServiceManagerProtocol {
    func fetchAllPosts(onSuccess: @escaping ([Character]) -> Void, onFail: @escaping (String?) -> Void)
}

enum ServiceEndPoint: String {

    case BASE_URL = "https://rickandmortyapi.com/api/character"
    //case API_KEY = ""

    static func fetchCharacters() -> String {
        "\(ServiceEndPoint.BASE_URL.rawValue)"
    }
}

struct ServisManager: ServiceManagerProtocol {

    func fetchAllPosts(onSuccess: @escaping ([Character]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(ServiceEndPoint.fetchCharacters(),
                   method: .get).responseDecodable(of: CharactersResponse.self) { response in
            guard let models = response.value else {
                onFail(response.debugDescription)
                return }
            onSuccess(models.results ?? [])
        }
    }
}
