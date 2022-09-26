//
//  AnasayfaProtocols.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {

    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView: PresenterToViewAnsayfaProtocol? {get set}

    func kisileriYukle()
    func ara(aramaKelimesi: String)
    func sil(kisi_id: Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? {get set}

    func tumKisileriAl()
    func kisiAra(aramaKelimesi: String)
    func kisiSil(kisi_id: Int)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi: Array<Kisiler>)
}

protocol PresenterToViewAnsayfaProtocol {
    func vieweVeriGonder(kisilerListesi: Array<Kisiler>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC)
}
