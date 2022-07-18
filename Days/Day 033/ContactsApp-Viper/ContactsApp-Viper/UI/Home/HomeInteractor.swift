//
//  HomeInteractor.swift
//  ContactsApp-Viper
//
//  Created by ali on 18.07.2022.
//

import Foundation

class HomeInteractor {
    var presenter: HomeInteractorOutputProtocol!
}

extension HomeInteractor: HomeInteractorInputProtocol {
    func getContactFromService() {
        var contacts = [Contact]()

        var yusuf = Contact(fullname: "Yusuf", gsm: "05311111111")
        contacts.append(yusuf)

        var ali = Contact(fullname: "Ali", gsm: "05322222222")
        contacts.append(ali)

        var mahmut = Contact(fullname: "Mahmut", gsm: "05333333333")
        contacts.append(mahmut)

        presenter.gotContact(contact: contacts)
    }
}
