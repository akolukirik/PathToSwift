//
//  EarthquakeInteractor.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import Foundation
import Alamofire

// Presenter
// verilerin indirileceği kısım

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }

    func DownloadEarthquakes()
}

class EarthquakeInteractor: AnyInteractor {

    var presenter: AnyPresenter?

    func DownloadEarthquakes() {

        let url = "https://apis.is/earthquake/is"

        AF.request(url, method: .get).responseDecodable(of: EarthquakeModel.self) { [weak self] response in
            if let model = response.value {
                self?.presenter?.interactorDidDownloadEarthquake(result: .success(model.results ?? []))
            }
        }
    }
}
