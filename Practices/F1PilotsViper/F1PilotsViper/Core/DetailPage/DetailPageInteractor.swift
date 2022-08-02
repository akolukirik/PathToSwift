//
//  DetailPageInteractor.swift
//  F1PilotsViper
//
//  Created by ali on 24.07.2022.
//

import Foundation
import Alamofire

protocol IDetailInteractor {
    var detailPresenter: IDetailPresenter? { get set }
    func downloadPilotsDetailRequest(pilotID: Int)
}

class PilotsDetailInteractor: IDetailInteractor {

    var detailPresenter: IDetailPresenter?

    func downloadPilotsDetailRequest(pilotID: Int) {
        let url = "https://my-json-server.typicode.com/akolukirik/demo2/driverDetail/\(pilotID)"
        AF.request(
            url,
            method: .get).responseDecodable(of: PilotDetail.self) { [weak self] response in
                if let detailModel = response.value {
                    self?.detailPresenter?.interactorDidDownloadPilots(result: .success(detailModel.items ?? []))
                  //  self?.navigateToDetailView(pilotDetail: model2)
                }
            }
    }
}
