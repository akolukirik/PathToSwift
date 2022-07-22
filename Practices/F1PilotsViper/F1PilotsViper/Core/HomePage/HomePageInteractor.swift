//
//  HomePageInteractor.swift
//  F1PilotsViper
//
//  Created by ali on 22.07.2022.
//  
//

import Foundation
import Alamofire

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    func downloadPilotsRequest()
}

class PilotsInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func downloadPilotsRequest() {
        let url = "https://my-json-server.typicode.com/akolukirik/demo2/drivers"

        AF.request(url, method: .get).responseDecodable(of: PilotModel.self) { [weak self] response in
            if let model = response.value {
                self?.presenter?.interactorDidDownloadPilots(result: .success(model.items ?? []))
            }
        }
    }
}
