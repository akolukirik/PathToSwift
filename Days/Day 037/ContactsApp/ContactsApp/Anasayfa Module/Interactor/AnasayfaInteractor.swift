//
//  AnasayfaInteractor.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?

    func tumKisileriAl() {

        var liste = [Kisiler]()

        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "123123123")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "qweqwe", kisi_tel: "56435")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "asdasd", kisi_tel: "3333")

        liste.append(k1)
        liste.append(k2)
        liste.append(k3)

        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }

    func kisiAra(aramaKelimesi: String) {
        print("Arama Sonucu: \(aramaKelimesi)")

    }

    func kisiSil(kisi_id: Int) {
        print("\(kisi_id) silindi")
    }

}
