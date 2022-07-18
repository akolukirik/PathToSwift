//
//  HomePresenter.swift
//  ContactsApp-Viper
//
//  Created by ali on 18.07.2022.
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol!
    var interactor: HomeInteractorInputProtocol!
    var router: HomeWireframeProtocol!
}

extension HomePresenter: HomePresenterProtocol {
    func getContact() {
        interactor.getContactFromService()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func gotContact(contact: [Contact]) {
        view.showContact(contact: contact)
    }
}
