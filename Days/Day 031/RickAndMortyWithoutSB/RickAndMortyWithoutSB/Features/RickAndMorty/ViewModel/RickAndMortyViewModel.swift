//
//  RickAndMortyViewModel.swift
//  RickAndMortyWithoutSB
//
//  Created by ali on 10.07.2022.
//

import Foundation

protocol IRickAndMortyViewModel {

    func fetchItems()
    func changeLoading()

    var rickAndMortyCharacters: [Result] { get set }
    var rickAndMortyService: IRickAndMortyService { get }
}

class RickAndMortyViewModel: IRickAndMortyViewModel {

    var rickAndMortyCharacters: [Result] = []

    let rickAndMortyService: IRickAndMortyService

    init() {
        rickAndMortyService = RickyAndMortyService()
    }

    func fetchItems() {
        changeLoading()
        rickAndMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickAndMortyCharacters = response ?? []
        }
    }

    func changeLoading() {

    }

}
