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
    func downloadPilotsDetailRequest()
}

class PilotsDetailInteractor: IDetailInteractor {
    var detailPresenter: IDetailPresenter?

    func downloadPilotsDetailRequest() {
        let url = "https://my-json-server.typicode.com/akolukirik/demo2/drivers"

        /* AF.request(url, method: .get).responseDecodable(of: PilotModel.self) { [weak self] response in
         if let model = response.value {
         self?.presenter?.interactorDidDownloadPilots(result: .success(model.items ?? []))
         }
         */
    }
}
