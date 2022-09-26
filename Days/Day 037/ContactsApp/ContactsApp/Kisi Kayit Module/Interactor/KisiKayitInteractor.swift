//
//  KisiKayitInteractor.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

class KisiKayitInteractor : PresenterToInteractorKisiKayitProtocol {

    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        print("Kişi Kayıt: \(kisi_ad) -  \(kisi_tel)")
    }

}
