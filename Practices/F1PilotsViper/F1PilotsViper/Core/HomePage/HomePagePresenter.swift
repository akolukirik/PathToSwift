//
//  HomePagePresenter.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//  
//

import Foundation

protocol AnyPresenter {
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    var router: AnyRouter? { get set }

    func interactorDidDownloadPilots(result: Result<[PilotResult],Error>)
}

class PilotsPresenter: AnyPresenter {

    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadPilotsRequest()
        }
    }

    var view: AnyView?
    var router: AnyRouter?

    func interactorDidDownloadPilots(result: Result<[PilotResult], Error>) {
        switch result {
        case .success(let pilots):
            view?.update(with: pilots)
        case .failure(let error):
            print("\(error)")
        }
    }
}
