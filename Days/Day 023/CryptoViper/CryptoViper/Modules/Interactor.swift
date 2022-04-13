//
//  Interactor.swift
//  CryptoViper
//
//  Created by ali on 13.04.2022.
//

import Foundation

protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    func downloadCrypto()

}

class CryptoInteractor {
    var presenter: AnyPresenter?

    func downloadCrypto() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json")
        else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            do{
                let cryptos = try JSONDecoder().decode([Crypto].self, from : data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            } catch {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task.resume()
    }
}
