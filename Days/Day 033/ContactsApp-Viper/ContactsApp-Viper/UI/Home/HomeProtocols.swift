//
//  HomeProtocols.swift
//  ContactsApp-Viper
//
//  Created by ali on 18.07.2022.
//

import Foundation

// MARK: Wireframe
protocol HomeWireframeProtocol: class {}

// MARK: Presenter
protocol HomePresenterProtocol: class {
    var interactor: HomeInteractorInputProtocol! { get set }

    func getContact()
}

// MARK: Interactor
// Interactor -> Presenter
protocol HomeInteractorOutputProtocol: class {
    func gotContact(contact: [Contact])
}

// Presenter -> Interactor
protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol!  { get set }

    func getContactFromService()
}

// MARK: View
protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol!  { get set }

    func showContact(contact: [Contact])
}
