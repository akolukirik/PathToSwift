//
//  DetailPagePresenter.swift
//  F1PilotsViper
//
//  Created by ali on 24.07.2022.
//

import Foundation

protocol IDetailPresenter {
    var detailInteractor: IDetailInteractor? { get set }
    var detailView: IDetailView? { get set }
    var detailRouter: IDetailRouter? { get set }

    func interactorDidDownloadPilotsDetail(result: Result<[PilotDetail],Error>)
}

class PilotsDetailPresenter: IDetailPresenter {

    var detailInteractor: IDetailInteractor?
    var detailView: IDetailView?
    var detailRouter: IDetailRouter?

    func interactorDidDownloadPilotsDetail(result: Result<[PilotDetail], Error>) {
        print("test")
    }

}
