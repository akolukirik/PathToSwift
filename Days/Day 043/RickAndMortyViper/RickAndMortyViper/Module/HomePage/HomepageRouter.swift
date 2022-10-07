//
//  HomepageRouter.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import Foundation
import UIKit

protocol HomePageRouterProtocol: AnyObject {
    func navigateToCharacterDetailPage(characterID: Int)
}

class HomepageRouter {

    weak var viewController: HomePageViewController?

    static func createModule() -> HomePageViewController {
        let viewController = UIStoryboard.loadViewController() as HomePageViewController

        let presenter = HomepagePresenter()
        let interactor = HomepageInteractor()
        let router = HomepageRouter()

        viewController.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController

        interactor.output = presenter

        router.viewController = viewController

        return viewController
    }
}

extension HomepageRouter: HomePageRouterProtocol {
    func navigateToCharacterDetailPage(characterID: Int) {
        let detailPage = CharacterDetailPageRouter.setupModule(title: characterID)
        // viewController?.present(detailPage, animated: true)
        viewController?.navigationController?.pushViewController(detailPage, animated: true)
    }
}
