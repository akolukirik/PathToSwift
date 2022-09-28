//
//  HomepageRouter.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import Foundation
import UIKit

protocol HomePageRouterProtocol: AnyObject {
    func navigateToCharacterDetailPage()
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
    func navigateToCharacterDetailPage() {
        let viewController = HomepageRouter.createModule()

        viewController.navigationController?.pushViewController(viewController, animated: true)
    }
}
