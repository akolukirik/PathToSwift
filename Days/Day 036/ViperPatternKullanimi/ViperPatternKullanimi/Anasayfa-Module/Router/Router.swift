//
//  Router.swift
//  ViperPatternKullanimi
//
//  Created by ali on 10.09.2022.
//

import Foundation

class Router: PresenterToRouterProtocol {
    static func createModule(ref: ViewController) {

        let presenter = Presenter()

        // View Sınıfı
        ref.presenterNesnesi = presenter

        // Presenter
        ref.presenterNesnesi?.interactor = Interactor()
        ref.presenterNesnesi?.view = ref

        // Interactor
        ref.presenterNesnesi?.interactor?.presenter = presenter
    }
}
