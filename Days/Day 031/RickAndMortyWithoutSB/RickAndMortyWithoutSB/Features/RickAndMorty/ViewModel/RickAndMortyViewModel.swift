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

    var rickAndMortyOutPut: RickAndMortyOutPut? { get }

    func setDelegate(output: RickAndMortyOutPut)
}

class RickAndMortyViewModel: IRickAndMortyViewModel {

    var rickAndMortyOutPut: RickAndMortyOutPut?

    func setDelegate(output: RickAndMortyOutPut) {
        rickAndMortyOutPut = output
    }

    var rickAndMortyCharacters: [Result] = []

    private var isLoading = false

    let rickAndMortyService: IRickAndMortyService

    init() {
        rickAndMortyService = RickyAndMortyService()
    }

    func fetchItems() {
        changeLoading()
        rickAndMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickAndMortyCharacters = response ?? []
            self?.rickAndMortyOutPut?.saveDatas(values: self?.rickAndMortyCharacters ?? [] )
        }
    }

    func changeLoading() {
        isLoading = !isLoading
        rickAndMortyOutPut?.changeLoading(isLoad: isLoading)
    }

}
