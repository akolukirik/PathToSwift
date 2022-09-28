//
//  HomepageInteractor.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import Foundation
import Alamofire

protocol IHomePageInteractorProtocol {
    func fecthAllCharacters()
}

protocol HomePageInteractorToPresenterProtocol {
    func sendDataToPresenter(dataList: Array<Character>?)
}

class HomepageInteractor: IHomePageInteractorProtocol {

    var output: HomePageInteractorToPresenterProtocol?

    func fecthAllCharacters() {

        let url = "https://rickandmortyapi.com/api/character"
        AF.request(url, method: .get).responseDecodable(of: CharactersResponse.self) { [self] response in
            if let models = response.value {
                output?.sendDataToPresenter(dataList: models.results)
            }
        }
    }
}
