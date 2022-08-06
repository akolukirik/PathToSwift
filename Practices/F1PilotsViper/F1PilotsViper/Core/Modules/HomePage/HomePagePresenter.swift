//
//  HomePagePresenter.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//  
//

import Foundation
import SwiftUI

protocol IPilotsPresenter: AnyObject {
    var itemsCount: Int { get }

    func viewDidLoad()
    func getItem(index: Int) -> PilotResult
    func didTappedPilot(index: Int)
}

class PilotsPresenter {
    weak var view: AnyView?
    var router: IPilotsRouter?
    var interactor: AnyInteractor?

    var pilotModel: PilotModel?
    /// UI Çağırma işlemlerini burada yapacağım.
    /// Didload'da çağırılacak kısım burası
    /// 

}

extension PilotsPresenter: IPilotsPresenter {
    func getItem(index: Int) -> PilotResult {
        pilotModel?.items?[index] ?? .empty()
    }

    var itemsCount: Int {
        pilotModel?.items?.count ?? 0
    }

    func viewDidLoad() {
        interactor?.downloadPilotsRequest()
    }

    func didTappedPilot(index: Int) {
        guard let title = getItem(index: index).name else { return }
        router?.navigateToDetail(title: title)
    }
}

extension PilotsPresenter: IPilotsInteractorToPresenter {
    func interactorDidDownloadPilots(result: Result<PilotModel, Error>) {
        switch result {
        case .success(let pilot):
            self.pilotModel = pilot
            view?.update()
        case .failure(let error):
            print("\(error)")
        }
    }
}
