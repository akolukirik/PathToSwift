//
//  EarthquakeInteractor.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import Foundation

// Presenter
// verilerin indirileceği kısım

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }

    func DownloadEarthquakes()
}

class EarthquakeInteractor: AnyInteractor {

    var presenter: AnyPresenter?

    func DownloadEarthquakes() {
        guard let url = URL(string: "https://apis.is/earthquake/is")
        else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadEarthquake(result: .failure(NetworkError.NetworkFailed))
                return
            }

            do {
                let earthquakes = try JSONDecoder().decode([EarthquakeResult].self,from: data)
                self?.presenter?.interactorDidDownloadEarthquake(result: .success(earthquakes))
            } catch {
                self?.presenter?.interactorDidDownloadEarthquake(result: .failure(NetworkError.ParsingFailed))
            }
        }
        task.resume()
    }
}
