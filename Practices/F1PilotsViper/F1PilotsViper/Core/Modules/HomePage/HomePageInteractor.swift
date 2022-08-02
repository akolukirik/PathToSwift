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
    func downloadPilotsRequest()
}

protocol IPilotsInteractorToPresenter: AnyObject {
    func interactorDidDownloadPilots(result: Result<PilotModel, Error>)
}

class PilotsInteractor: AnyInteractor {
    weak var output: IPilotsInteractorToPresenter?

    func downloadPilotsRequest() {
        let url = "https://my-json-server.typicode.com/akolukirik/demo2/drivers"

        AF.request(url, method: .get).responseDecodable(of: PilotModel.self) { [weak self] response in
            if let model = response.value {
                self?.output?.interactorDidDownloadPilots(result: .success(model))
            }
        }
    }
}
