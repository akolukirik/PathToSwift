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
    func didTappedCharacter(characterID: Int)
}

class HomepagePresenter : ViewToPresenterHomepageProtocol {

    var interactor: IHomePageInteractorProtocol?
    var router: HomePageRouterProtocol?
    var view: PresenterToViewHomepageProtocol?

    private var characterList: [Character]?

    var characterListCount: Int {
        characterList?.count ?? 0
    }

    func viewDidLoad() {
        interactor?.fecthAllCharacters()
    }

    func getCharacter(index: Int) -> Character? {
        characterList?[index]
    }

    func didTappedCharacter(characterID: Int) {
        guard let index = getCharacter(index: characterID)?.id else { return }
        router?.navigateToCharacterDetailPage(characterID: index)
    }
}

extension HomepagePresenter : HomePageInteractorToPresenterProtocol {
    func sendDataToPresenter(dataList: CharactersResponseModel?) {
        self.characterList = dataList?.results
        view?.reloadTableView()
    }
}
