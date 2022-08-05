//
//  Router.swift
//  ViperPattern
//
//  Created by ali on 5.08.2022.
//

import Foundation

class Router : PresenterToRouterProtocol {
    static func createModule(ref: ViewController) {
        let presenter = Presenter()

        //View katmanı değişkenleri
        ref.presenterNesnesi = presenter

        //Presenter katmanı değişkenleri
        ref.presenterNesnesi?.interactor = Interactor()
        ref.presenterNesnesi?.view = ref

        //Interactor katmanı değişkenleri
        ref.presenterNesnesi?.interactor?.presenter = presenter
    }
}
