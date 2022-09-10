//
//  Presenter.swift
//  ViperPatternKullanimi
//
//  Created by ali on 10.09.2022.
//

import Foundation

class Presenter: ViewToPresenterProtocol {
    var interactor: PreseterToInteractorProtocol?
    var view: PresenterToViewProtocol?

    func toplamaYap(sayi1: String, sayi2: String) {
        interactor?.topla(sayi1: sayi1, sayi2: sayi2)
    }

    func carpmaYap(sayi1: String, sayi2: String) {
        interactor?.carp(sayi1: sayi1, sayi2: sayi2)
    }
}

extension Presenter: InteractorToPresenterProtocol {

    func presenteraVeriGonder(sonuc: String) {
        view?.vieweVeriGonder(sonuc: sonuc)
    }
}
