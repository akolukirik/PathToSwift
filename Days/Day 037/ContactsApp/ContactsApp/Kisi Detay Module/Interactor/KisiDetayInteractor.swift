//
//  KisiDetayInteractor.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

class KisiDetayInteractor : PresenterToInteractorKisiDetayProtocol {

    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        print("Kişi Güncelle: \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }

}
