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
    // TODO: Declare wireframe methods
}

class CharacterDetailPageRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(title: String) -> CharacterDetailPageViewController {
        let viewController = UIStoryboard.loadViewController() as CharacterDetailPageViewController
        let presenter = CharacterDetailPagePresenter(title: title)
        let router = CharacterDetailPageRouter()
        let interactor = CharacterDetailPageInteractor()

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
    // TODO: Implement wireframe methods
}
