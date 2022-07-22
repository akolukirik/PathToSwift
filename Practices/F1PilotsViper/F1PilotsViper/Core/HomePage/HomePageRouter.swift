//
//  HomePageRouter.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//  
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    static func startExecution() -> AnyRouter
    var entry: EntryPoint? { get }
}

class PilotsRouter: AnyRouter {

    var entry: EntryPoint?

    static func startExecution() -> AnyRouter {
        let router = PilotsRouter()

        var view: AnyView = HomePageViewController()
        var presenter: AnyPresenter = PilotsPresenter()
        var interactor: AnyInteractor = PilotsInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.presenter = presenter

        router.entry = view as? EntryPoint

        return router
    }
}
