//
//  HomepagePresenter.swift
//  RickAndMortyViper
//
//  Created by Ali Kolukirik on 27.09.2022.
//

import Foundation

protocol ViewToPresenterHomepageProtocol {
    var characterListCount: Int { get }

    func viewDidLoad()
    func getCharacter(index: Int) -> Character?
}

class HomepagePresenter : ViewToPresenterHomepageProtocol {
    var interactor: IHomePageInteractorProtocol?
    weak var router: HomePageRouterProtocol?
    var view: PresenterToViewHomepageProtocol?

    private var characterList: [Character]?

    var characterListCount: Int {
        characterList?.count ?? 0
    }

    func viewDidLoad() {
        interactor?.fecthAllCharacters()
        router?.navigateToCharacterDetailPage()
    }

    func getCharacter(index: Int) -> Character? {
        characterList?[index]
    }
}

extension HomepagePresenter : HomePageInteractorToPresenterProtocol {
    func sendDataToPresenter(dataList: Array<Character>?) {
        self.characterList = dataList
        view?.reloadTableView()
    }
}
