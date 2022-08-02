//
//  HomePageRouter.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//  
//

import Foundation
import UIKit

protocol IPilotsRouter {
    func navigateToDetail(title: String)
}

class PilotsRouter {

    weak var view: UIViewController?

    static func startExecution() -> HomePageViewController {
        let router = PilotsRouter()

        let view = HomePageViewController()
        let presenter = PilotsPresenter()
        let interactor = PilotsInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.view = view

        return view
    }
}

extension PilotsRouter: IPilotsRouter {
    func navigateToDetail(title: String) {
        let detailPage = DetailPageRouter.setupModule(title: title)
        view?.present(detailPage, animated: true)
    }
}
