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
    func sendDataToPresenter(dataList: CharactersResponseModel?)
}

class HomepageInteractor: IHomePageInteractorProtocol {

    var output: HomePageInteractorToPresenterProtocol?

    private let characterListService : ServiceProtocol = Service()

    func fecthAllCharacters() {
        characterListService.fetchCharacters { (models) in
            self.output?.sendDataToPresenter(dataList: models)
        } onError: { (data) in
            print(data )
        }
    }
}
