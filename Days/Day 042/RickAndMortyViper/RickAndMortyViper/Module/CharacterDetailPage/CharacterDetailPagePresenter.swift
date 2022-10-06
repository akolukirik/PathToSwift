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

    let title: String

    init(title: String) {
        self.title = title
    }
}

extension CharacterDetailPagePresenter: ICharacterDetailPagePresenter {
    func viewDidLoad() {
        view?.setTitleLabelText(title)
    }
}

extension CharacterDetailPagePresenter: ICharacterDetailPageInteractorToPresenter {
    // TODO: implement interactor output methods
}
