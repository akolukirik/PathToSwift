//
//  KisiDetayPresenter.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

class KisiDetayPresenter : ViewToPresenterKisiDetayProtocol {
    
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?


    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        kisiDetayInteractor?.kisiGuncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }

}
