//
//  CharacterDetailPageInteractor.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//  
//

import Foundation

protocol ICharacterDetailPageInteractor: AnyObject {
    func deneme()
}

protocol ICharacterDetailPageInteractorToPresenter: AnyObject {
    func allahIcinVeriyiGonder(data: CharacterDetailResponse?)
}

class CharacterDetailPageInteractor: ICharacterDetailPageInteractor {

    weak var output: ICharacterDetailPageInteractorToPresenter?

    private let lutfenVeriAl : ServiceProtocol = Service()

    let title: Int

    init(title: Int) {
        self.title = title
    }

    func deneme() {
        lutfenVeriAl.getCharacterDetail(characterID: title) { (model) in
            self.output?.allahIcinVeriyiGonder(data: model)
            print(model?.name ?? "ağla")
        } onError: { (error) in
            print(error)
        }
    }
}
