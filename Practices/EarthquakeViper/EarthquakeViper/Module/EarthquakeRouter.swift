//
//  EarthquakeRouter.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import Foundation
import UIKit

// entrypoint

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    static func startExecution() -> AnyRouter
    var entry: EntryPoint? { get }
}

class EarthquakeRouter: AnyRouter {

    var entry: EntryPoint?

    static func startExecution() -> AnyRouter {
        let router = EarthquakeRouter()

        var view: AnyView = EarthquakeViewController()
        var presenter: AnyPresenter = EarthquakePresenter()
        var interactor: AnyInteractor = EarthquakeInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.presenter = presenter

        router.entry = view as? EntryPoint

        return router
    }
}
