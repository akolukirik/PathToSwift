//
//  CharacterDetailPageInteractor.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//  
//

import Foundation

protocol ICharacterDetailPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol ICharacterDetailPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class CharacterDetailPageInteractor {

    // MARK: Properties

    weak var output: ICharacterDetailPageInteractorToPresenter?
}

extension CharacterDetailPageInteractor: ICharacterDetailPageInteractor {
    // TODO: Implement use case methods
}
