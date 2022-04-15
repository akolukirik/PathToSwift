//
//  Presenter.swift
//  CryptoViper
//
//  Created by ali on 13.04.2022.
//

import Foundation

enum NetworkError : Error {
    case networkFailed
    case parsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? { get set }
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?

    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCrypto()
        }
    }

    var view: AnyView?

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
            case .success(let cryptos):
                view?.update(with: cryptos)
            case .failure(_):
                view?.update(with: "Try again later")
        }
    }

}
