//
//  DetailPageRouter.swift
//  F1PilotsViper
//
//  Created by ali on 2.08.2022.
//  
//

import Foundation
import UIKit

protocol IDetailPageRouter: AnyObject {
    // TODO: Declare wireframe methods
}

class DetailPageRouter {

    // MARK: Properties∫

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule(title: String) -> DetailPageViewController {
        let viewController = UIStoryboard.loadViewController() as DetailPageViewController
        let presenter = DetailPagePresenter(title: title)
        let router = DetailPageRouter()
        let interactor = DetailPageInteractor()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .pageSheet

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension DetailPageRouter: IDetailPageRouter {
    // TODO: Implement wireframe methods
}
