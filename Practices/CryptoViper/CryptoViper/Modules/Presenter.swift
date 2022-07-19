//
//  Presenter.swift
//  CryptoViper
//
//  Created by ali on 19.07.2022.
//

import Foundation

//talks to -> interactor, router, view

enum NetworkError: Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {

    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }

    func interactorDidDownloadCrypto(result: Result<[Crypto],Error>)

}

class CryptoPresenter: AnyPresenter {

    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    var view: AnyView?

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
            print("update")
        case .failure(let error):
            view?.update(with: "\(error) Keşbiş ulsin ne oltu :(")
            print("error")
        }
    }

}
