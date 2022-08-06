//
//  DetailPageRouter.swift
//  F1PilotsViper
//
//  Created by ali on 24.07.2022.
//

import Foundation

protocol IDetailRouter {
    static func startExecution() -> IDetailRouter
}

class PilotsDetailRouter: IDetailRouter {

    static func startExecution() -> IDetailRouter {
        let detailRouter = PilotsDetailRouter()

        var detailView: IDetailView = DetailPageViewController()
        var detailPresenter: IDetailPresenter = PilotsDetailPresenter()
        var detailInteractor: IDetailInteractor = PilotsDetailInteractor()

        detailView.detailPresenter = detailPresenter

        detailPresenter.detailView = detailView
        detailPresenter.detailRouter = detailRouter
        detailPresenter.detailInteractor = detailInteractor

        detailInteractor.detailPresenter = detailPresenter

        return detailRouter
    }
}
