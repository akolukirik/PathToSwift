//
//  KisiKayitRouter.swift
//  ContactsApp
//
//  Created by Ali Kolukirik on 26.09.2022.
//

import Foundation

class KisiKayitRouter : PresenterToRouterKisiKayitProtocol {

    static func createModule(ref: KisiKayitVC) {
        ref.kisiKayitPresenterNesnesi = KisiKayitPresenter()
        ref.kisiKayitPresenterNesnesi?.kisiKayitInteractor = KisiKayitInteractor()
    }
}
