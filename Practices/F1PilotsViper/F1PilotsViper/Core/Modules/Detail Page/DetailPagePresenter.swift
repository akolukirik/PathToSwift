//
//  DetailPagePresenter.swift
//  F1PilotsViper
//
//  Created by ali on 2.08.2022.
//  
//

import Foundation

protocol IDetailPagePresenter: AnyObject {
    func viewDidLoad()
}

class DetailPagePresenter {

    // MARK: Properties

    weak var view: IDetailPageViewController?
    var router: IDetailPageRouter?
    var interactor: IDetailPageInteractor?

    let title: String

    init(title: String) {
        self.title = title
    }
}

extension DetailPagePresenter: IDetailPagePresenter {
    func viewDidLoad() {
        view?.setTitleLabelText(title)
    }
}

extension DetailPagePresenter: IDetailPageInteractorToPresenter {
    // TODO: implement interactor output methods
}
