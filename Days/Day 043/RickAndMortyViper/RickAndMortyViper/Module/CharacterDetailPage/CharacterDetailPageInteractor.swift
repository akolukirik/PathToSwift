//
//  CharacterDetailPageInteractor.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//  
//

import Foundation

protocol ICharacterDetailPageInteractor: AnyObject {
    func fecthCharacterDetail()
}

protocol ICharacterDetailPageInteractorToPresenter: AnyObject {
    func sendDataToPresenter(data: CharacterDetailResponse?)
}

class CharacterDetailPageInteractor: ICharacterDetailPageInteractor {

    weak var output: ICharacterDetailPageInteractorToPresenter?

    private let characterDetailService : ServiceProtocol = Service()

    let characterID: Int

    init(characterID: Int) {
        self.characterID = characterID
    }

    func fecthCharacterDetail() {
        characterDetailService.getCharacterDetail(characterID: characterID) { (model) in
            self.output?.sendDataToPresenter(data: model)
            print(model?.name ?? "ağla")
        } onError: { (error) in
            print(error)
        }
    }
}
