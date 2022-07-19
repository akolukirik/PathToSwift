//
//  EarthquakePresenter.swift
//  EarthquakeViper
//
//  Created by ali on 20.07.2022.
//

import Foundation

// interactor, view, router

enum NetworkError: Error {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var interactor: AnyInteractor? { get set}
    var view: AnyView? { get set }
    var router: AnyRouter? { get set }

    func interactorDidDownloadEarthquake(result: Result<[EarthquakeResult],Error>)
}

class EarthquakePresenter: AnyPresenter {

    var interactor: AnyInteractor? {
        didSet{
            interactor?.DownloadEarthquakes()
        }
    }
    var view: AnyView?
    var router: AnyRouter?

    func interactorDidDownloadEarthquake(result: Result<[EarthquakeResult], Error>) {
        switch result {
        case .success(let earthquakes):
            view?.update(with: earthquakes)
        case .failure(let error):
            print("\(error)")
        }
    }


}
