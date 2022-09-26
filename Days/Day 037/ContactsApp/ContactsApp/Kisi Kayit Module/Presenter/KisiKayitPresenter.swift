//
//  KisiKayitPresenter.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

class KisiKayitPresenter : ViewToPresenterKisiKayitProtocol {

    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol?

    func ekle(kisi_ad: String, kisi_tel: String) {
        kisiKayitInteractor?.kisiEkle(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }

}
