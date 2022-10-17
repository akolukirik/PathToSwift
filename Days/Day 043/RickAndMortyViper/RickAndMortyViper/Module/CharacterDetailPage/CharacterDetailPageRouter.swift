//
//  CharacterDetailPageRouter.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 5.10.2022.
//  
//

import Foundation
import UIKit

protocol ICharacterDetailPageRouter: AnyObject {

}

class CharacterDetailPageRouter {

    weak var view: UIViewController?

    static func setupModule(characterID: Int) -> CharacterDetailPageViewController {
        let viewController = UIStoryboard.loadViewController() as CharacterDetailPageViewController
        let presenter = CharacterDetailPagePresenter()
        let router = CharacterDetailPageRouter()
        let interactor = CharacterDetailPageInteractor(characterID: characterID)

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension CharacterDetailPageRouter: ICharacterDetailPageRouter {

}
