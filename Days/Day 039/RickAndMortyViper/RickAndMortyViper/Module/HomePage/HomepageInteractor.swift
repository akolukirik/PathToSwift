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

    private let characterListService: ServiceManagerProtocol = ServisManager()

    func fecthAllCharacters() {
        characterListService.fetchAllPosts { [weak self] (models) in
            self?.output?.sendDataToPresenter(dataList: models.self)
        } onFail: { (data) in
            print(data ?? "")
        }
    }
}
