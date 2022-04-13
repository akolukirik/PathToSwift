//
//  Presenter.swift
//  CryptoViper
//
//  Created by ali on 13.04.2022.
//

import Foundation

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor {get set}
    var view : AnyView? {get set}

    func interactorDidDownloadCrypto(result : Result<[Crypto],Error>)
}

class CryptoPresenter : AnyPresenter {

    var router: AnyRouter?

    var interactor: AnyInteractor

    var view: AnyView?

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            print("update")
        case .failure(let error):
            print("error")
        }
    }
}
