//
//  KisiDetayProtocols.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

protocol ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol? {get set}

    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String)
}

protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String)
}
protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: KisiDetayVC)
}
