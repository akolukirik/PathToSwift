//
//  HomeRouter.swift
//  ContactsApp-Viper
//
//  Created by ali on 18.07.2022.
//

import Foundation

class HomeRouter: NSObject {
    var controller: HomeTableController!
    var presenter: HomePresenter!
    var interactor: HomeInteractor!

    required override init() {
        super.init()

        interactor = HomeInteractor()
        presenter = HomePresenter()
        controller = HomeTableController()

        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = controller
        controller.presenter = presenter
    }
}

extension HomeRouter: HomeWireframeProtocol {}
