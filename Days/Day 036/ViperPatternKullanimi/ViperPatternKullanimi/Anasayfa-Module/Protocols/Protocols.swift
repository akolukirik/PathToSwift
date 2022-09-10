//
//  Protocols.swift
//  ViperPatternKullanimi
//
//  Created by ali on 29.08.2022.
//

import Foundation

//Ana Protocol'ler

protocol ViewToPresenterProtocol {
    var interactor: PreseterToInteractorProtocol? {get set}
    var view: PresenterToViewProtocol? {get set}
 
    func toplamaYap(sayi1: String, sayi2: String)
    func carpmaYap(sayi1: String, sayi2: String)
}

protocol PreseterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? {get set}

    func topla(sayi1: String, sayi2: String)
    func carp(sayi1: String, sayi2: String)
}

//Taşıyıcı Protocol'ler

protocol InteractorToPresenterProtocol {
    func presenteraVeriGonder(sonuc: String)
}

protocol PresenterToViewProtocol {
    func vieweVeriGonder(sonuc: String)
}

protocol PresenterToRouterProtocol {
    static func createModule(ref: ViewController)
}
