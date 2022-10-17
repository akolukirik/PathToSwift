//
//  CharacterDetailPagePresenter.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//  
//

import Foundation

protocol ICharacterDetailPagePresenter: AnyObject {
    func viewDidLoad()
}

class CharacterDetailPagePresenter {

    weak var view: ICharacterDetailPageViewController?
    var router: ICharacterDetailPageRouter?
    var interactor: ICharacterDetailPageInteractor?
}

extension CharacterDetailPagePresenter: ICharacterDetailPagePresenter {
    func viewDidLoad() {
        interactor?.fecthCharacterDetail()
    }
}

extension CharacterDetailPagePresenter: ICharacterDetailPageInteractorToPresenter {
    func sendDataToPresenter(data: CharacterDetailResponse?) {
        view?.setTitleLabelText(data?.name ?? "noluurrrrrrrrrrrrr",
                                image: data?.image ?? "otur ağla")
    }
}
