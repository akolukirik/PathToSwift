//
//  DetailPageInteractor.swift
//  F1PilotsViper
//
//  Created by ali on 2.08.2022.
//  
//

import Foundation

protocol IDetailPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IDetailPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class DetailPageInteractor {

    // MARK: Properties

    weak var output: IDetailPageInteractorToPresenter?
}

extension DetailPageInteractor: IDetailPageInteractor {
    // TODO: Implement use case methods
}
