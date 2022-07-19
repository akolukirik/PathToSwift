//
//  Router.swift
//  CryptoViper
//
//  Created by ali on 19.07.2022.
//

import UIKit

// We setup every component here to orchestrate and route the application

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    static func startExecution() -> AnyRouter
    var entry : EntryPoint? {get}
}

class CryptoRouter : AnyRouter {

    var entry: EntryPoint?

    static func startExecution() -> AnyRouter {

        let router = CryptoRouter()

        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.presenter = presenter

        router.entry = view as? EntryPoint

        return router
    }
}

